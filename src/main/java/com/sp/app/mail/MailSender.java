package com.sp.app.mail;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sp.app.common.FileManager;
import com.sp.app.prop.PropReader;

@Service("mail.myMailSender")
public class MailSender {
	
	
	@Autowired
	private FileManager fileManager;
	
	private String mailType; // 메일 타입
	private String encType;
	private String pathname;

	public MailSender() {
		this.encType = "utf-8";
		this.mailType = "text/html; charset=utf-8";
		this.pathname = "c:" + File.separator + "temp" + File.separator + "mail";
	}

	public void setPathname(String pathname) {
		this.pathname = pathname;
	}

	private class SMTPAuthenticator extends javax.mail.Authenticator {
		PropReader prop = new PropReader();
		@Override
		public PasswordAuthentication getPasswordAuthentication() {
			String username = prop.readNaverEmail();
			String password = prop.readnaverPwd(); // 패스워드;
			return new PasswordAuthentication(username, password);
		}
	}

	private void makeMessage(Message msg, Mail dto) throws MessagingException {
		if (dto.getSelectFile() == null || dto.getSelectFile().isEmpty()) {
			
			msg.setContent(dto.getContent(), "text/html; charset=utf-8");
			msg.setHeader("Content-Type", mailType);
		} else {
			MimeBodyPart mbp1 = new MimeBodyPart();
			mbp1.setContent(dto.getContent(), "text/html; charset=utf-8");
			mbp1.setHeader("Content-Type", mailType);

			Multipart mp = new MimeMultipart();
			mp.addBodyPart(mbp1);

			for (MultipartFile mf : dto.getSelectFile()) {
				if (mf.isEmpty()) {
					continue;
				}

				try {
					String saveFilename = fileManager.doFileUpload(mf, pathname);
					if (saveFilename != null) {
						dto.getSavePathname().add(pathname + File.separator + saveFilename);

						String originalFilename = mf.getOriginalFilename();
						MimeBodyPart mbp2 = new MimeBodyPart();
						FileDataSource fds = new FileDataSource(pathname + File.separator + saveFilename);
						mbp2.setDataHandler(new DataHandler(fds));

						if (originalFilename == null || originalFilename.length() == 0) {
							mbp2.setFileName(MimeUtility.encodeWord(fds.getName()));
						} else {
							mbp2.setFileName(MimeUtility.encodeWord(originalFilename));
						}
						
						mp.addBodyPart(mbp2);
					}
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}

			msg.setContent(mp);
		}
	}

	public boolean mailSend(Mail dto) {
		PropReader prop = new PropReader();
		boolean b = false;

		Properties p = new Properties();
		
		p.put("mail.smtp.user", prop.readNaverId());
		
		String host = "smtp.naver.com";
		
		p.put("mail.smtp.host", host);
		
		p.put("mail.smtp.port", "465");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");
		
		p.put("mail.smtp.ssl.enable", "true");
		p.put("mail.smtp.ssl.trust", host);
		
		try {
			Authenticator auth = new SMTPAuthenticator();
			Session session = Session.getDefaultInstance(p, auth);
			
			session.setDebug(true);

			Message msg = new MimeMessage(session);

			// 보내는 사람
			if (dto.getSenderName() == null || dto.getSenderName().equals("노른자")) {
				msg.setFrom(new InternetAddress(dto.getSenderEmail()));
			} else {
				msg.setFrom(new InternetAddress(dto.getSenderEmail(), dto.getSenderName(), encType));
			}

			msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(dto.getReceiverEmail()));
			
			msg.setSubject(dto.getSubject());

			makeMessage(msg, dto);
			msg.setHeader("X-Mailer", dto.getSenderName());

			msg.setSentDate(new Date());
			
			Transport.send(msg);

			// 메일 전송후 서버에 저장된 첨부 파일 삭제
			if (dto.getSavePathname() != null && dto.getSavePathname().size() > 0) {
				for (String filename : dto.getSavePathname()) {
					File file = new File(filename);
					if (file.exists()) {
						file.delete();
					}
				}
			}

			b = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return b;
	}
}
