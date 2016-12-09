<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="pizza.PMF" %>
<%@ page import="pizza.Pizza" %>

<%@ page import="javax.jdo.PersistenceManager" %>
<%@ page import="javax.jdo.Query" %>
<%@ page import="java.text.MessageFormat" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Pizza count</title>
</head>
<body>
エンティティの入力：<br>
トッピング
<form action="/new" method="post">
   <div>
      <textarea name="topping" rows="1" cols="20" ></textarea>
   </div>
   <div>
      <input type="radio" name="slice" value="1"> 1
      <input type="radio" name="slice" value="2"> 2
      <input type="radio" name="slice" value="3"> 3
      <input type="radio" name="slice" value="4"> 4
      <input type="radio" name="slice" value="5"> 5
   </div>
   <input type="submit" value="Submit" />
</form>
<p>
<%
PersistenceManager pm = null;
try {
    pm = PMF.get().getPersistenceManager();
    Query query = pm.newQuery(Pizza.class);
    List<Pizza> pizzas = (List<Pizza>) query.execute();

	// すべてのエンティティの表示
	for (Pizza pz : pizzas) {
%>
      <div>
      <%= pz.getTopping() %> が <%= pz.getSlice().toString() %> 枚
      </div>            
<%
    }
} finally {
    if (pm != null && !pm.isClosed())
       pm.close();
}
%>
</p>
<p>エンティティのリセット：
  <form action="/del" method="post">
    <input type="submit" value="Submit" />
 </form>
</p>

</body>
</html>