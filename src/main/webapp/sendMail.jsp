<%@ page import="java.util.Properties, javax.mail.*, javax.mail.internet.*" %>
<%
    String from = request.getParameter("from");
    String to = request.getParameter("to");
    String subject = request.getParameter("subject");
    String messageContent = request.getParameter("message");

    final String username = "sathishn1503@gmail.com"; // Replace with your email
    final String password = "bzgauvkvrfrwdofe"; // Replace with your email password

    // SMTP Server Configuration (Gmail example)
    Properties props = new Properties();
    props.put("mail.smtp.auth", "true");
    props.put("mail.smtp.starttls.enable", "true");
    props.put("mail.smtp.host", "smtp.gmail.com");
    props.put("mail.smtp.port", "587");
    props.put("mail.smtp.ssl.trust", "smtp.gmail.com");

    // Create a session with authentication
    Session session11 = Session.getInstance(props, new javax.mail.Authenticator() {
        protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(username, password);
        }
    });

    try {
        // Create a new email message
        Message message = new MimeMessage(session11);
        message.setFrom(new InternetAddress(from));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
        message.setSubject(subject);
        message.setText(messageContent);

        // Send the email
        Transport.send(message);

        out.println("<script>alert('Email Sent Successfully!'); window.location='main.jsp';</script>");
    } catch (MessagingException e) {
        e.printStackTrace();
        out.println("<script>alert('Failed to send email! Check credentials or internet.'); window.location='main.jsp';</script>");
    }
%>
