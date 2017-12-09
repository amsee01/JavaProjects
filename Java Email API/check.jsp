<%-- 
    Document   : check
    Created on : Dec 22, 2016, 12:16:23 PM
    Author     : student
--%>

<%@page  import="java.util.Properties, javax.mail.*,javax.mail.internet.*,java.util.UUID" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>
        <%
        final String username = request.getParameter("user");
        final String password = request.getParameter("pass");
        final String emailto = request.getParameter("emails");
        final String messages = request.getParameter("message");
        final String subs = request.getParameter("subject");
        
        Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");

		Session newses = Session.getInstance(props,
		  new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		  });
                
                

		try {
                    String uuid = UUID.randomUUID().toString();
                    uuid= "HUNU"+uuid.substring(0, Math.min(uuid.length(), 7));

			Message messagem = new MimeMessage(newses);
			messagem.setFrom(new InternetAddress(username));
			messagem.setRecipients(Message.RecipientType.TO,
				InternetAddress.parse(emailto));
			messagem.setSubject(subs);
			messagem.setText(messages);

			Transport.send(messagem);   

			//JOptionPane.showMessageDialog(this, "done");
                        out.print("MESSAGE SENT SUCCESSFULLY");

		} catch (MessagingException e) {
			out.print("ERROR! PLEASE CHECK CREDENTIALS!");
		}
                
        %>
        </h1>
    </body>
</html>
