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
	private static final String URLprojectoverview = "http://157.230.103.186:8080/Project_BBP/projectoverview.jsp";
	private static final String URLcontact = "http://157.230.103.186:8080/Project_BBP/contact.jsp";


    
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
			
		subject = "BBP – Mosbach: Sie haben erfolgreich Ihr Projekt "+project.getTitle()+" "+"eingereicht";
		
		message =  "Sehr geehrte/r "+ user.getFirstname()+" "+user.getname()+",\n"+"\n"+
				"Vielen Dank für Ihr Interesse am Bürgerbeteiligungsportals Mosbach!\n"+
				"Sie haben soeben ihr Projekt "+project.getTitle()+" "+"eingereicht.\n\n"+
				"Nach einer formalen Prüfung durch die Verwaltung, wird der Projektantrag veröffentlicht.\n\n"+
				"Kopie Ihres Projektes:\n\n"+
				"Titel: "+project.getTitle()+"\n"+
				"Kategorie: "+project.getCategory()+"\n"+
				"Kurzbeschreibung: "+project.getShort_description()+"\n"+
				"Beschreibung: "+project.getDescription()+"\n"+
				"Ort: "+project.getLocation()+"\n"+
				"Zeitraum: "+project.getPeriod()+"\n"+
				"Investitiongrad: "+project.getInvestment_grade()+"\n"+
				"Telefonnummer: "+project.getPhone_numer()+"\n"+
				"Erstellt: "+project.getStamp_created()+"\n\n"+
				"Projectreferenz für Fragen: "+project.getId()+""+
				"Link zu Ihrem Projekt: http://157.230.103.186:8080/Project_BBP/projectdetailview.jsp?projectid="+project.getId()+""+" "+
				

				"Schauen Sie sich doch in der Zwischenzeit weitere Projekte von anderen Nutzerinnen und Nutzern der Stadt Mosbach an! "+URLprojectoverview+" \n"+ 

				"Ihr Team des Bürgerbeteiligungsportals Mosbach\n"+
				"Haben Sie Fragen? Dann wenden Sie sich doch an uns unter Nutzung des Kontaktformulars "+URLcontact+"";
    	
    	return sendEmail(user.getEmail(), subject, message);
    }
    
    public static boolean sendDeclined (Project project) {
    	User user = project.getUser();
		String message = null;
		String subject = null;
		
		
    	subject = "BBP – Mosbach: Ihr Projekt "+project.getTitle()+"+ wurde abgelehnt";
    	return false;
    }
    
    
    
}
