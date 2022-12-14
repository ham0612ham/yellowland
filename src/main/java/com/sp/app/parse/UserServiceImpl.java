package com.sp.app.parse;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.StringWriter;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Service;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

@Service("parse.userService")
public class UserServiceImpl implements UserService {
	@Override
	public Map<String, Object> serializeNode(String spec) {
		// XML 문서를 파싱하여 Map에 저장
		
		Map<String, Object> map = new HashMap<>();

		InputStream is = null;
		try {
			List<User> list = new ArrayList<>();

			// InputSource : XML 엔티티의 단일 입력 소스
			is = new URL(spec).openConnection().getInputStream(); // 주소를 읽어들임 (is는 바이트스트림)
			InputSource source = new InputSource(new InputStreamReader(is, "UTF-8")); // InputSource : XML에 있는 내용을 입력받을 수 있는 객체

			// DOM Document를 생성하기 위하여 팩토리 생성
			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
			// factory.setIgnoringElementContentWhitespace(false);
			                // 각 태그와 다음 태그의 사이의 공백 및 개행 문자 등을 제거하지 않음

			// 팩토리로부터 Document 파서를 얻어내도록 한다.
			DocumentBuilder parser = factory.newDocumentBuilder();

			// Document DOM 파서로 하여금 입력받은 파일을 파싱하도록 요청한다.
			Document xmlDoc = parser.parse(source);
/*
			// InputSource 클래스를 사용하지 않고 commons-io 패키지 IOUtils 클래스사용 하는 경우
			is = new URL(spec).openConnection().getInputStream();
			is = IOUtils.toInputStream(IOUtils.toString(is, "UTF-8"), "UTF-8");
 			
			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
			DocumentBuilder parser = factory.newDocumentBuilder();
			Document xmlDoc = parser.parse(is);
 */

			// Element : XML 문서의 원소를 표현하기 위해 사용
			Element root = xmlDoc.getDocumentElement(); // XML 루트 요소
			
			Node nodeCount = root.getElementsByTagName("dataCount").item(0); // dataCount 노드를 가져오는 것 (하나짜리 가져오는 방법)
			String dataCount = nodeCount.getFirstChild().getNodeValue();
			
			NodeList items = root.getElementsByTagName("record");
			for (int i = 0; i < items.getLength(); i++) {
				Node item = items.item(i);
				NodeList itemList = item.getChildNodes(); // 자식들을 가져옴

				// 속성값 가져오기
				NamedNodeMap itemMap = item.getAttributes();
				String num = itemMap.getNamedItem("num").getNodeValue();

				User user = new User();
				user.setNum(Integer.parseInt(num));
				for (int j = 0; j < itemList.getLength(); j++) {
					Node e = itemList.item(j);

					if (e.getNodeType() == Node.ELEMENT_NODE) {
						String name = e.getNodeName();
						String value = e.getChildNodes().item(0).getNodeValue();

						if (name.equals("name")) {
							user.setName(value);
						} else if (name.equals("content")) {
							user.setContent(value);
						} else if (name.equals("created")) {
							user.setCreated(value);
						}
					}
				}

				list.add(user);
			}

			map.put("dataCount", dataCount);
			map.put("list", list);

		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			if (is != null) {
				try {
					is.close();
				} catch (Exception e2) {
				}
			}
		}

		return map;
	}

	@Override
	public String documentWriter(String spec) {
		// Document(XML)를 String으로 변환
		
		StringWriter writer = new StringWriter();
		InputStream is = null;
		try {
			is = new URL(spec).openConnection().getInputStream();
			is = IOUtils.toInputStream(IOUtils.toString(is, "UTF-8"), "UTF-8");

			// DOM Document를 생성하기 위하여 팩토리를 생성한다
			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();

			// 팩토리로부터 Document 파서를 얻어내도록 한다.
			DocumentBuilder parser = factory.newDocumentBuilder();

			// Document DOM 파서로 하여금 입력받은 파일을 파싱하도록 요청한다.
			Document xmlDoc = parser.parse(is);

			// Document를 String으로 변환
			DOMSource domSource = new DOMSource(xmlDoc);
			StreamResult result = new StreamResult(writer);
			TransformerFactory tf = TransformerFactory.newInstance();
			Transformer transformer = tf.newTransformer();
			transformer.transform(domSource, result);

		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			if (is != null) {
				try {
					is.close();
				} catch (Exception e2) {
				}
			}
		}

		return writer.toString();
	}
}
