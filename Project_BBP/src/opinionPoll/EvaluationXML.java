package opinionPoll;

import java.io.StringWriter;
import java.util.LinkedList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.w3c.dom.Attr;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

public class EvaluationXML {
	
	public static String generateXML (int op_id) {
		OpinionPoll op = OpinionPoll.getOp(op_id);
		List<String> header = op.getHeader();
		List<String> headerWithoutBlanks = new LinkedList<String>();
		OpChoice opChoice = op.getChoice();
		int [] choice = opChoice.getChoice();
		
		//remove all blanks in string for xml --> blanks are invalid xml characters
		for (int i= 0; i<header.size(); i++) {
			String s = header.get(i).replaceAll("\\s+","");
			headerWithoutBlanks.add(s);
		}
		
		try {

			DocumentBuilderFactory docFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder docBuilder = docFactory.newDocumentBuilder();

			// root elements
			Document doc = docBuilder.newDocument();
			Element rootElement = doc.createElement("abstimmung");
			doc.appendChild(rootElement);

			// opinionpoll elements
			Element data = doc.createElement("grunddaten");
			rootElement.appendChild(data);

			// set attribute to opinionpoll element
			Attr attr = doc.createAttribute("id");
			attr.setValue(op.getId()+"");
			data.setAttributeNode(attr);

			// shorten way
			// data.setAttribute("id", "1");

			// title elements
			Element title = doc.createElement("titel");
			title.appendChild(doc.createTextNode(op.getTitle()));
			data.appendChild(title);

			// short_description elements
			Element short_description = doc.createElement("kurzbeschreibung");
			short_description.appendChild(doc.createTextNode(op.getShort_description()));
			data.appendChild(short_description);

			// description elements
			Element description = doc.createElement("beschreibung");
			description.appendChild(doc.createTextNode(op.getDescription()));
			data.appendChild(description);

			// max_choice elements
			Element max_choice = doc.createElement("antwortmoeglichkeiten");
			max_choice.appendChild(doc.createTextNode(op.getMax_choice()+""));
			data.appendChild(max_choice);

			// max_choice elements
			Element date_from = doc.createElement("datumvon");
			date_from.appendChild(doc.createTextNode(op.getDate_from().toString()));
			data.appendChild(date_from);
			
			Element date_to = doc.createElement("datumbis");
			date_to.appendChild(doc.createTextNode(op.getDate_to().toString()));
			data.appendChild(date_to);
			
			Element created = doc.createElement("erstellt");
			created.appendChild(doc.createTextNode(op.getMax_choice() + ""));
			data.appendChild(created);
			
			Element test = doc.createElement("test");
			test.appendChild(doc.createTextNode(op.getMax_choice() + ""));
			data.appendChild(test);
			
			// opinionpoll elements
			Element evaluation = doc.createElement("auswertung");
			rootElement.appendChild(evaluation);

			// set attribute to opinionpoll element
//			Attr attri = doc.createAttribute("id");
//			attri.setValue(op.getId() + "");
//			evaluation.setAttributeNode(attri);
			Element dynamic = null;
			
			for (int i = 0; i<headerWithoutBlanks.size(); i++) {
				System.out.println("Auswahl_"+headerWithoutBlanks.get(i));
				dynamic = doc.createElement("Auswahl_"+headerWithoutBlanks.get(i));
				System.out.println(choice[i]+"");
				dynamic.appendChild(doc.createTextNode(choice[i]+""));
				evaluation.appendChild(dynamic);
			}
			//doc.createElement("testerie").appendChild(doc.createTextNode("test von einem element"));
			
//			Element teste = doc.createElement("test");
//			test.appendChild(doc.createTextNode(op.getMax_choice() + ""));
//			evaluation.appendChild(teste);
//			
//			teste = doc.createElement("test");
//			test.appendChild(doc.createTextNode(op.getMax_choice() + ""));
//			evaluation.appendChild(teste);
//			

			// write the content into xml file
			TransformerFactory transformerFactory = TransformerFactory.newInstance();
			Transformer transformer = transformerFactory.newTransformer();
			DOMSource source = new DOMSource(doc);
			
			TransformerFactory tf = TransformerFactory.newInstance();
			Transformer transformer1 = tf.newTransformer();
			transformer.setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, "yes");
			StringWriter writer = new StringWriter();
			transformer1.transform(new DOMSource(doc), new StreamResult(writer));
			return writer.getBuffer().toString().replaceAll("\n|\r", "");

		  } catch (ParserConfigurationException pce) {
			pce.printStackTrace();
		  } catch (TransformerException tfe) {
			tfe.printStackTrace();
		  }
		return null;
		
	}

}
