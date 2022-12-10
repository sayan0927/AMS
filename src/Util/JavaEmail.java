/**
 *
 * @author Sayan
 */
package Util;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class JavaEmail {
    Session mailSession;


    public static void mail(String email,String emailSub,String emailBod) throws AddressException, MessagingException {
        JavaEmail javaEmail = new JavaEmail();
        javaEmail.setMailServerProperties();
        javaEmail.draftEmailMessage(email,emailSub,emailBod);
        javaEmail.sendEmail(email,emailSub,emailBod);
    }

    private void setMailServerProperties() {
        Properties emailProperties = System.getProperties();
        emailProperties.put("mail.smtp.port", "587");
        emailProperties.put("mail.smtp.auth", "true");
        emailProperties.put("mail.smtp.starttls.enable", "true");
        mailSession = Session.getDefaultInstance(emailProperties, null);
    }

    private MimeMessage draftEmailMessage(String recipient,String emailSub,String emailBod) throws AddressException, MessagingException {


        String[] toEmails = {recipient};
        MimeMessage emailMessage = new MimeMessage(mailSession);
        /**
         * Set the mail recipients
         * */
        for (int i = 0; i < toEmails.length; i++) {
            emailMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmails[i]));
        }
        emailMessage.setSubject(emailSub);
        /**
         * If sending HTML mail
         * */
        emailMessage.setContent(emailBod, "text/html");
        /**
         * If sending only text mail
         * */
        //emailMessage.setText(emailBody);// for a text email
        return emailMessage;
    }

    private void sendEmail(String recipient,String emailSub,String emailBod) throws AddressException, MessagingException {
        /**
         * Sender's credentials
         * */
        String fromUser = Config.systemEmail;

        //https://stackoverflow.com/questions/35347269/javax-mail-authenticationfailedexception-535-5-7-8-username-and-password-not-ac
        //using generated password from 2 step verification app passwords
        String fromUserEmailPassword = Config.systemEmailPassword;

        String emailHost = Config.systemEmailHost;
        Transport transport = mailSession.getTransport("smtp");
        transport.connect(emailHost, fromUser, fromUserEmailPassword);
        /**
         * Draft the message
         * */
        MimeMessage emailMessage = draftEmailMessage(recipient,emailSub,emailBod);
        /**
         * Send the mail
         * */
        transport.sendMessage(emailMessage, emailMessage.getAllRecipients());
        transport.close();
        System.out.println("Email sent successfully.");
    }
}