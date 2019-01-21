package emailsender;
import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import project.*;
import user.*;

public class EmailSend {
	private static final String host ="smtp.gmail.com" ;
	private static final String user = "mosbach.buergerbeteiligung@gmail.com";
	private static final String pass = "bbpadmin";
	private static final String from = "mosbach.buergerbeteiligung@gmail.com";


    
    public static boolean sendEmail(String email, String subject, String message) {
		try {
			String to = email;
			String messageText = message;
			boolean sessionDebug = false;

			Properties props = System.getProperties();

			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.host", host);
			props.put("mail.smtp.port", "587");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.starttls.required", "true");

			java.security.Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
			Session mailSession = Session.getDefaultInstance(props, null);
			mailSession.setDebug(sessionDebug);
			Message msg = new MimeMessage(mailSession);
			msg.setFrom(new InternetAddress(from));
			InternetAddress[] address = { new InternetAddress(to) };
			msg.setRecipients(Message.RecipientType.TO, address);
			msg.setSubject(subject);
			msg.setSentDate(new Date());
			msg.setText(messageText);

			Transport transport = mailSession.getTransport("smtp");
			transport.connect(host, user, pass);
			transport.sendMessage(msg, msg.getAllRecipients());
			transport.close();
			System.out.println("message send successfully");
			return true;
		} catch (Exception ex) {
			System.out.println(ex);
			return false;
		}
	}
    
    public static boolean sendSubmitted (Project project) {
		User user = project.getUser();
		String message = null;
		String subject = null;
		
		subject = "Sie habe erfolgreich "+ project.getTitle()+" eingereicht";
		
		message = "Hallo "+ user.getFirstname()+" "+user.getname()+",\n"+"\n"+
			"folgendes Projekt wurde bei uns Eingereicht: \n"+
				"Titel: "+project.getTitle()+"\n"+
				"Kategorie: "+project.getCategory()+"\n"+
				"Kurzbeschreibung: "+project.getShort_description()+"\n"+
				"Beschreibung: "+project.getDescription()+"\n"+
				"Ort: "+project.getLocation()+"\n"+
				"Zeitraum: "+project.getPeriod()+"\n"+
				"Investitiongrad: "+project.getInvestment_grade()+"\n"+
				"Telefonnummer: "+project.getPhone_numer()+"\n"+
				"Erstellt: "+project.getStamp_created()+"\n";
    	
    	
    	
    	return sendEmail(user.getEmail(), subject, message);
    }
    
    
    
}
