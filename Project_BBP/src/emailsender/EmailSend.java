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
	
	//constants for the email dispatch
	private static final String host ="smtp.gmail.com" ;
	private static final String user = "mosbach.buergerbeteiligung@gmail.com";
	private static final String pass = "bbpadmin";
	private static final String from = "mosbach.buergerbeteiligung@gmail.com";
	private static final String URLprojectoverview = "http://157.230.103.186:8080/Project_BBP/projectoverview.jsp";
	private static final String URLcontact = "http://157.230.103.186:8080/Project_BBP/contact.jsp";


    
    public static boolean sendEmail(String email, String subject, String message) {		//to dispatch an email
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
    
    //email when someone creates a project
    
    public static boolean sendSubmitted (Project project) {
		User user = project.getUser();
		String message = null;
		String subject = null;
			
		subject = "BBP – Mosbach: Sie haben erfolgreich Ihr Projekt "+project.getTitle()+" "+"eingereicht";
		
		message = introduction(user)+
				"Sie haben soeben ihr Projekt "+project.getTitle()+" "+"eingereicht."+
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
				"Erstellt: "+project.getStamp_created()+
				projectSignifier(project) +
				end();

    	return sendEmail(user.getEmail(), subject, message);
    }
    
    //email send to creator when his projects is approved by administration
    
    public static boolean sendApproveAdministration (Project project) {
    	User user = project.getUser();
		String message = null;
		String subject = null;
		
		subject = "BBP – Mosbach: Ihr Projektantrag "+project.getTitle()+" wurde freigegeben";
		
		message = introduction(user)+
				"Nach einer formalen Prüfung Ihres Projektantrags "+project.getTitle()+" "+" kann ist dieser nun zur Unterstützung freigegeben und veröffentlicht. \n" + 
				"Nutzen Sie nun die Chance und werben Sie für Ihre Projekt, sodass es die 360 Mindestunterstützungen erreicht, um in einer Gemeinderatssitzung thematisiert zu werden. \n" + 
				projectSignifier(project)+
				end();			
		return sendEmail(user.getEmail(), subject, message);
    }
    
    // email send to the creator when the project has as many votes as 1,5 percent of the total
	// population
    
    public static boolean sendMinimumVotes(Project project) {
    	User user = project.getUser();
		String message = null;
		String subject = null;
		
		subject = "BBP – Mosbach: Ihr Project "+project.getTitle()+" hat die Mindestunterstützungen erreicht! ";
		
		message = introduction(user)+
				"Ihr Projekt "+project.getTitle()+" "+"  hat die Mindestunterstützungen erreicht! Nach einer Prüfung gem. §20b GemO BW durch den Gemeinderat, wird das Projekt in den kommenden 3 Monaten in einer Gemeinderatsitzung thematisiert. Über den weiteren Verlauf werden Sie durch einen Vertreter des Gemeinderats zu gegebener Zeit informiert. "+
				end();
		
		return sendEmail(user.getEmail(), subject, message);
    }
    
    //email send to creator when his projects is declined by administration
    
    public static boolean sendDeclinedAdministration (Project project) {
    	User user = project.getUser();
		String message = null;
		String subject = null;
		
		
		
    	subject = "BBP – Mosbach: Ihr Projekt "+project.getTitle()+" wurde abgelehnt";
    	
    	message = introduction(user)+
				
				
				"\nNach einer formalen Prüfung Ihres Projektantrags" +project.getComment()+" "+"kann dieser nicht veröffentlicht werden. \n"
						+ "Die Gründe dafür entnehmen Sie bitte dem folgenden Kommentar der Stadtverwaltung: "+project.getComment()+" \n"+
						"Gerne können Sie nach erfolgreicher Überarbeitung Ihren Projektantrag erneut einstellen.\n"+ 
				projectSignifier(project)+
				end();
  
    	return sendEmail(user.getEmail(), subject, message);
    }
    
    //email send to creator when his projects is declined by council
    
    public static boolean sendDeclineCouncil (Project project) {
    	User user = project.getUser();
		String message = null;
		String subject = null;
		
		subject = "BBP – Mosbach: Ihr Projekt "+project.getTitle()+" entspricht nicht den Anforderungen gem. §20b GemO BW";
    	
		message = introduction(user)+
		"\n" + 
		"Nach einer Prüfung Ihres Projektantrags durch den Gemeinderat wird dieses Projekt nicht weiter bearbeitet. Die Gründe dafür entnehmen Sie bitte dem folgenden Kommentar des Gemeinderats: "+project.getComment()+ 
		end();	
		return sendEmail(user.getEmail(), subject, message);
    }
    
    //email send to creator when his projects is approved by council
    
    public static boolean sendApproveCouncil (Project project) {
    	User user = project.getUser();
		String message = null;
		String subject = null;
		
		subject = "BBP – Mosbach: Ihr Projekt "+project.getTitle()+" wird umgesetzt!";
		
		message = introduction(user)+
				"Ihr Projekt hat die Gemeinderatsmitglieder überzeugt! Der Gemeinderat hat über Ihr Projekt in einer Gemeinderatssitzung beraten und ist zu folgendem Beschluss gekommen: \n\n" + 
				project.getComment()+
				"\n\nSomit ist das Projekt abgeschlossen und kann nach dem erstellen eines Verwaltungsmitarbeiters im Blog eingesehen werden. http://157.230.103.186:8080/Project_BBP/blog.jsp \n" + 
				end();
				
		return sendEmail(user.getEmail(), subject, message);
    }
    
    //methods to avoid duplicate code
    
    private static String introduction(User user) {
    	return "Sehr geehrte/r "+ user.getFirstname()+" "+user.getname()+",\n"+"\n"+
    			"Vielen Dank für Ihr Interesse am Bürgerbeteiligungsportals Mosbach!\n";
    }
    
    private static String end () {
    	return"\nSchauen Sie sich doch in der Zwischenzeit weitere Projekte von anderen Nutzerinnen und Nutzern der Stadt Mosbach an! "+URLprojectoverview+" \n"+
				"Ihr Team des Bürgerbeteiligungsportals Mosbach.\n\n"+
				"Haben Sie Fragen? Dann wenden Sie sich doch an uns unter Nutzung des Kontaktformulars. "+URLcontact+"";
    }
    
    private static String projectSignifier (Project project) {
    return	"\n\nProjektreferenz bei Fragen: "+project.getId()+". \n"+ 	
				"Link zu Ihrem Projekt: http://157.230.103.186:8080/Project_BBP/projectdetailview.jsp?projectid="+project.getId()+". \n"+" ";
    	
    }
    
    
    
}
