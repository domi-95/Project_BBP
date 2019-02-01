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
			
		subject = "BBP � Mosbach: Sie haben erfolgreich Ihr Projekt "+project.getTitle()+" "+"eingereicht";
		
		message = introduction(user)+
				"Sie haben soeben ihr Projekt "+project.getTitle()+" "+"eingereicht."+
				"Nach einer formalen Pr�fung durch die Verwaltung, wird der Projektantrag ver�ffentlicht.\n\n"+
				"Kopie Ihres Projektes:\n\n"+
				"Titel: "+project.getTitle()+"\n"+
				"Kategorie: "+project.getCategory()+"\n"+
				"Kurzbeschreibung: "+project.getShort_description()+"\n"+
				"Beschreibung: "+project.getDescription()+"\n"+
				"Ort: "+project.getLocation()+"\n"+
				"Zeitraum: "+project.getPeriod()+"\n"+
				"Investitiongrad: "+project.getInvestment_grade()+"\n"+
				"Telefonnummer: "+project.getPhone_numer()+"\n"+
				"Erstellt: "+project.getStamp_created()+
				projectSignifier(project) +
				end();

    	return sendEmail(user.getEmail(), subject, message);
    }
    
    public static boolean sendApproveAdministration (Project project) {
    	User user = project.getUser();
		String message = null;
		String subject = null;
		
		subject = "BBP � Mosbach: Ihr Projektantrag "+project.getTitle()+" wurde freigegeben";
		
		message = introduction(user)+
				"Nach einer formalen Pr�fung Ihres Projektantrags "+project.getTitle()+" "+" kann ist dieser nun zur Unterst�tzung freigegeben und ver�ffentlicht. \n" + 
				"Nutzen Sie nun die Chance und werben Sie f�r Ihre Projekt, sodass es die 360 Mindestunterst�tzungen erreicht, um in einer Gemeinderatssitzung thematisiert zu werden. \n" + 
				projectSignifier(project)+
				end();			
		return sendEmail(user.getEmail(), subject, message);
    }
    
    public static boolean sendMinimumVotes(Project project) {
    	User user = project.getUser();
		String message = null;
		String subject = null;
		
		subject = "BBP � Mosbach: Ihr Project "+project.getTitle()+" hat die Mindestunterst�tzungen erreicht! ";
		
		message = introduction(user)+
				"Ihr Projekt "+project.getTitle()+" "+"  hat die Mindestunterst�tzungen erreicht! Nach einer Pr�fung gem. �20b GemO BW durch den Gemeinderat, wird das Projekt in den kommenden 3 Monaten in einer Gemeinderatsitzung thematisiert. �ber den weiteren Verlauf werden Sie durch einen Vertreter des Gemeinderats zu gegebener Zeit informiert. "+
				end();
		
		return sendEmail(user.getEmail(), subject, message);
    }
    
    public static boolean sendDeclinedAdministration (Project project) {
    	User user = project.getUser();
		String message = null;
		String subject = null;
		
		
		
    	subject = "BBP � Mosbach: Ihr Projekt "+project.getTitle()+" wurde abgelehnt";
    	
    	message = introduction(user)+
				
				
				"\nNach einer formalen Pr�fung Ihres Projektantrags" +project.getComment()+" "+"kann dieser nicht ver�ffentlicht werden. \n"
						+ "Die Gr�nde daf�r entnehmen Sie bitte dem folgenden Kommentar der Stadtverwaltung: "+project.getComment()+" \n"+
						"Gerne k�nnen Sie nach erfolgreicher �berarbeitung Ihren Projektantrag erneut einstellen.\n"+ 
				projectSignifier(project)+
				end();
  
    	return sendEmail(user.getEmail(), subject, message);
    }
    
    public static boolean sendDeclineCouncil (Project project) {
    	User user = project.getUser();
		String message = null;
		String subject = null;
		
		subject = "BBP � Mosbach: Ihr Projekt "+project.getTitle()+" entspricht nicht den Anforderungen gem. �20b GemO BW";
    	
		message = introduction(user)+
		"\n" + 
		"Nach einer Pr�fung Ihres Projektantrags durch den Gemeinderat wird dieses Projekt nicht weiter bearbeitet. Die Gr�nde daf�r entnehmen Sie bitte dem folgenden Kommentar des Gemeinderats: "+project.getComment()+ 
		end();	
		return sendEmail(user.getEmail(), subject, message);
    }
    
    public static boolean sendApproveCouncil (Project project) {
    	User user = project.getUser();
		String message = null;
		String subject = null;
		
		subject = "BBP � Mosbach: Ihr Projekt "+project.getTitle()+" wird umgesetzt!";
		
		message = introduction(user)+
				"Ihr Projekt hat die Gemeinderatsmitglieder �berzeugt! Der Gemeinderat hat �ber Ihr Projekt in einer Gemeinderatssitzung beraten und ist zu folgendem Beschluss gekommen: \n\n" + 
				project.getComment()+
				"\n\nSomit ist das Projekt abgeschlossen und kann nach dem erstellen eines Verwaltungsmitarbeiters im Blog eingesehen werden. http://157.230.103.186:8080/Project_BBP/blog.jsp \n" + 
				end();
				
		return sendEmail(user.getEmail(), subject, message);
    }
    
    private static String introduction(User user) {
    	return "Sehr geehrte/r "+ user.getFirstname()+" "+user.getname()+",\n"+"\n"+
    			"Vielen Dank f�r Ihr Interesse am B�rgerbeteiligungsportals Mosbach!\n";
    }
    
    private static String end () {
    	return"\nSchauen Sie sich doch in der Zwischenzeit weitere Projekte von anderen Nutzerinnen und Nutzern der Stadt Mosbach an! "+URLprojectoverview+" \n"+
				"Ihr Team des B�rgerbeteiligungsportals Mosbach.\n\n"+
				"Haben Sie Fragen? Dann wenden Sie sich doch an uns unter Nutzung des Kontaktformulars. "+URLcontact+"";
    }
    
    private static String projectSignifier (Project project) {
    return	"\n\nProjektreferenz bei Fragen: "+project.getId()+". \n"+ 	
				"Link zu Ihrem Projekt: http://157.230.103.186:8080/Project_BBP/projectdetailview.jsp?projectid="+project.getId()+". \n"+" ";
    	
    }
    
    
    
}
