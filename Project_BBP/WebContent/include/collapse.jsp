<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">



<!-- Bootstrap style -->
<link rel="stylesheet" type="text/css" href="../style/bootstrap.min.css" media="screen" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</head>
<body>
<style>
@import url('//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css');


.collapse-head  h5:before {
   font-family: 'FontAwesome';
   content: "\f078";
   float: right;
   transition: all 0.5s;
   color: #fff;
 
}
.collapse-head.active h5:before {
	-webkit-transform: rotate(180deg);
	-moz-transform: rotate(180deg);
	transform: rotate(180deg);
    content: "\f054"; 

} 
</style>
<script>
$('.panel-collapse').on('show.bs.collapse', function () {
    $(this).siblings('.panel-heading').addClass('active');
  });

  $('.panel-collapse').on('hide.bs.collapse', function () {
    $(this).siblings('.panel-heading').removeClass('active');
  });
</script>

<div id="accordion" class="w-75  bordershadow">
  <div class="card">
    <div class="card-header collapse-head" id="headingOne" >
      <h5 class="mb-0" data-toggle="collapse" data-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
        <button class="btn btn-link" >
          Was ist das BBP?
        </button>
      </h5>
    </div>

    <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordion">
      <div class="card-body collapse-body">
    	<ul>
  			<li>Das Bürgerbeteiligungsportal (BBP) dient zur direkten Beteiligung an städtischen Vorhaben der Mosbacher Bürgerinnen und Bürger.</li>
  			<li >Sie können Projekte vorschlagen, über diese abstimmen und die Ideen dem Gemeinderat präsentieren.</li>
  			<li>Es dient nicht zuletzt der Transparenz und liefert Informationen über aktuelle und erfolgreich umgesetzte Projekte.</li>
		</ul>
       
       </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header collapse-head" id="headingTwo" >
      <h5 class="mb-0" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
        <button class="btn btn-link collapsed" >
          Was sind Projekte?
        </button>
      </h5>
    </div>
    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
      <div class="card-body collapse-body">
        
        <ul>
  			<li>Projekte sind Ideen, Anregungen oder Visionen zu Vorhaben in Mosbach, die von Ihnen als Mosbacher Bürgerinnen und Bürgern vorgeschlagen werden können.</li>
  			<li >Um ein Projekt einzureichen, muss ein Projektantrag ausgefüllt werden, welcher nach Prüfung eines Verwaltungsmitarbeiters bzgl. formalen Aspekten veröffentlicht wird.</li>
  			
		</ul>
        
        </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header collapse-head" id="headingThree" >
      <h5 class="mb-0" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
        <button class="btn btn-link collapsed" >
          Wie geht es nach der Veröffentlichung des Projektantrages weiter? 
        </button>
      </h5>
    </div>
    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordion">
      <div class="card-body collapse-body">
        <ul>
  			<li>Die Stadtverwaltung prüft den Projektantrag auf formale Aspekte und Vollständigkeit. Ist dies gegeben wird dieser veröffentlicht.</li>
  			<li>Nun geht es um das Werben für Ihr Projekt!</li>
  			<li>Ab 360 Unterstützungen muss der Gemeinderat den Projektantrag innerhalb der darauffolgenden 3 Monate in einer Gemeinderatssitzung thematisieren.</li>
  			<li>Der Gemeinderat prüft den Projektantrag inhaltlich und erklärt ihn für zulässig oder unzulässig gem. §20b GemO BW. Der Gemeinderat, die jeweiligen Fraktionen oder auch einzelnen Abgeordnete haben dann die Möglichkeit sich zu verschiedenen Themen zu positionieren und entsprechend Ihr Projekt zu kommentieren.</li>
  			<li>Bei jedem Vorgang werden Sie entsprechend via E-Mail informiert, sodass Sie immer Kenntnis vom aktuellen Stand ihres Projektes haben.</li>
		</ul>
        </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header collapse-head" id="headingFour" >
      <h5 class="mb-0" data-toggle="collapse" data-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
        <button class="btn btn-link collapsed" >
          Was sind Abstimmungen?
        </button>
      </h5>
    </div>
    <div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-parent="#accordion">
      <div class="card-body collapse-body">
        
        <ul>
  			<li>Vorgeschlagene Projekte können von angemeldeten Bürgerinnen und Bürgern nach formaler Freigabe und Veröffentlichung unterstützt werden.</li>
  			<li >Unterstützt werden kann jedes Projekt von jeder Mosbacher Bürgerin und von jedem Mosbacher Bürger genau einmal.</li>
  			<li>Werben Sie also für Ihr Projekt!</li>
  			<br>
  			<img src="https://i.ibb.co/NnYGXvT/Wie-unterst-tze-ich-ein-Projekt.png" width="100%" height="100%"> 
		</ul>
        
        </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header collapse-head" id="headingFive" >
      <h5 class="mb-0" data-toggle="collapse" data-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
        <button class="btn btn-link collapsed" >
          Wie unterstütze ich Projekte?
        </button>
      </h5>
    </div>
    <div id="collapseFive" class="collapse" aria-labelledby="headingFive" data-parent="#accordion">
      <div class="card-body collapse-body">
        
        <ul>
  			<li>Neben den Projekten gibt es auch Abstimmungen, die ein Stimmungsbild der Bürgerinnen und Bürger dem Gemeinderat liefern.</li>
  			<li >Über ausgewählte Themen können die Bürgerinnen und Bürger über einen ausgewählten Zeitraum dem Gemeinderat Feedback geben und somit aktiv städtische Vorhaben gestalten.</li>
  			<li>Die Abstimmungen werden vom Gemeinderat, von Fraktionen des Gemeinderats oder auch von einzelne Abgeordneten zu ausgewählten Themen erstellt.</li>
		</ul>
        
        </div>
    </div>
  </div>
  
</div>
</body>
</html>