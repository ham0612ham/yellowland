<%@ page contentType='text/html; charset=UTF-8'%><%@ page trimDirectiveWhitespaces='true' %><%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%><%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt' %><div id="tableSpace"><table class="tbl_col treetable" id="table1" summary="연차별 생존율"><caption>연차별 생존율</caption> <colgroup> <col style="width: 260px"/> <col/><col style="width:7.7%"/><col style="width:7.7%"/><col style="width:7.7%"/><col style="width:7.7%"/><col style="width:7.7%"/><col style="width:7.7%"/><col style="width:7.7%"/><col style="width:7.7%"/><col style="width:7.7%"/> </colgroup> <thead> <tr> <th rowspan="3">행정구역</th><th rowspan="2">생활밀접업종</th> <th colspan="3">2019년 3분기</th> <th colspan="3">2020년 3분기</th> <th colspan="3">2021년 3분기</th> </tr> <tr><th>1년<br/>생존율</th> <th>3년<br/>생존율</th> <th>5년<br/>생존율</th> <th>1년<br/>생존율</th> <th>3년<br/>생존율</th> <th>5년<br/>생존율</th> <th>1년<br/>생존율</th> <th>3년<br/>생존율</th> <th>5년<br/>생존율</th> </tr> </thead> <tbody> <tr class="branch expanded" data-tt-id="1"> <td class="left"><span class="indenter" style="padding-left: 0px;"><a href="#" title="Collapse"><span hidden="hidden">하위 메뉴 펼침</span></a></span>서울시전체</td> <td>전체/<br/>한식음식점</td> <td>76</td> <td>53</td> <td>39</td> <td>73.8</td> <td>46.3</td> <td>32.9</td> <td>74</td> <td>45</td> <td>32.6</td></tr> <tr class="branch" data-tt-id="2" data-tt-parent-id="1" style="display: none;"> <td class="left"><span class="indenter"></span>종로구</td> <td>전체/<br/>한식음식점</td> <td>77.6</td> <td>53.1</td> <td>40.8</td> <td>69.2</td> <td>43.6</td> <td>35.9</td> <td>81</td> <td>49.2</td> <td>36.5</td></tr> <tr class="leaf" data-tt-id="2-1" data-tt-parent-id="2" style="display: none;"> <td class="left"><span class="indenter"></span>종로·청계 관광특구 <br/><p class="uPart">(종로1.2.3.4가동)</p></td> <td>전체/<br/>한식음식점</td> <td>77.6</td> <td>53.1</td> <td>40.8</td> <td>69.2</td> <td>43.6</td> <td>35.9</td> <td>81</td> <td>49.2</td> <td>36.5</td></tr> <tr class="branch" data-tt-id="3" data-tt-parent-id="1" style="display: none;"> <td class="left"><span class="indenter"></span>중구</td> <td>전체/<br/>한식음식점</td> <td>74.1</td> <td>45.7</td> <td>29.6</td> <td>75.2</td> <td>48.5</td> <td>36.6</td> <td>67.9</td> <td>42.7</td> <td>29.8</td></tr> <tr class="leaf" data-tt-id="3-1" data-tt-parent-id="3" style="display: none;"> <td class="left"><span class="indenter"></span>동대문패션타운 관광특구 <br/><p class="uPart">(광희동)</p></td> <td>전체/<br/>한식음식점</td> <td>66.7</td> <td>41.7</td> <td>33.3</td> <td>70</td> <td>45</td> <td>40</td> <td>66.7</td> <td>33.3</td> <td>30</td></tr> <tr class="leaf" data-tt-id="3-1" data-tt-parent-id="3" style="display: none;"> <td class="left"><span class="indenter"></span>명동 남대문 북창동 다동 무교동 관광특구 <br/><p class="uPart">(소공동)</p></td> <td>전체/<br/>한식음식점</td> <td>75.4</td> <td>46.4</td> <td>29</td> <td>76.5</td> <td>49.4</td> <td>35.8</td> <td>68.3</td> <td>45.5</td> <td>29.7</td></tr> <tr class="branch" data-tt-id="4" data-tt-parent-id="1" style="display: none;"> <td class="left"><span class="indenter"></span>용산구</td> <td>전체/<br/>한식음식점</td> <td>69.6</td> <td>56.5</td> <td>39.1</td> <td>82.4</td> <td>52.9</td> <td>35.3</td> <td>88.9</td> <td>55.6</td> <td>38.9</td></tr> <tr class="leaf" data-tt-id="4-1" data-tt-parent-id="4" style="display: none;"> <td class="left"><span class="indenter"></span>이태원 관광특구 <br/><p class="uPart">(이태원1동)</p></td> <td>전체/<br/>한식음식점</td> <td>69.6</td> <td>56.5</td> <td>39.1</td> <td>82.4</td> <td>52.9</td> <td>35.3</td> <td>88.9</td> <td>55.6</td> <td>38.9</td></tr> <tr class="branch" data-tt-id="5" data-tt-parent-id="1" style="display: none;"> <td class="left"><span class="indenter"></span>강남구</td> <td>전체/<br/>한식음식점</td> <td>100</td> <td>80</td> <td>80</td> <td>75</td> <td>75</td> <td>50</td> <td>100</td> <td>33.3</td> <td>33.3</td></tr> <tr class="leaf" data-tt-id="5-1" data-tt-parent-id="5" style="display: none;"> <td class="left"><span class="indenter"></span>강남 마이스 관광특구 <br/><p class="uPart">(삼성1동)</p></td> <td>전체/<br/>한식음식점</td> <td>100</td> <td>80</td> <td>80</td> <td>75</td> <td>75</td> <td>50</td> <td>100</td> <td>33.3</td> <td>33.3</td></tr> <tr class="branch" data-tt-id="6" data-tt-parent-id="1" style="display: none;"> <td class="left"><span class="indenter"></span>송파구</td> <td>전체/<br/>한식음식점</td> <td>75.7</td> <td>59.5</td> <td>45.9</td> <td>75</td> <td>40</td> <td>15</td> <td>74.4</td> <td>41.9</td> <td>32.6</td></tr> <tr class="leaf" data-tt-id="6-1" data-tt-parent-id="6" style="display: none;"> <td class="left"><span class="indenter"></span>잠실 관광특구 <br/><p class="uPart">(오륜동)</p></td> <td>전체/<br/>한식음식점</td> <td>75.7</td> <td>59.5</td> <td>45.9</td> <td>75</td> <td>40</td> <td>15</td> <td>74.4</td> <td>41.9</td> <td>32.6</td></tr> </tbody><tfoot></tfoot></table></div>