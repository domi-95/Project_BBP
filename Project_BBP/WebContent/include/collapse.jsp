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

</style>
<script>
$(document).on('show','.accordion', function (e) {
    //$('.accordion-heading i').toggleClass(' ');
    $(e.target).prev('.collapse-head').addClass('show');
});

$(document).on('hide','.accordion', function (e) {
   $(this).find('.collapse-head').not($(e.target)).removeClass('show');
   //$('.accordion-heading i').toggleClass('fa-chevron-right fa-chevron-down');
});
</script>

<div id="accordion" class="w-75  bordershadow">
  <div class="card">
    <div class="card-header collapse-head" id="headingOne" >
      <div class="mb-0" data-toggle="collapse" data-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
        <button class="btn btn-link font-weight-bold" >
          <span>Was ist das BBP?</span>
        </button>
      </div>
    </div>

    <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordion">
      <div class="card-body collapse-body">
    	<ul>
  			<li>Das B�rgerbeteiligungsportal (BBP) dient zur direkten Beteiligung an st�dtischen Vorhaben der Mosbacher B�rgerinnen und B�rger.</li>
  			<li >Sie k�nnen Projekte vorschlagen, �ber diese abstimmen und die Ideen dem Gemeinderat pr�sentieren.</li>
  			<li>Es dient nicht zuletzt der Transparenz und liefert Informationen �ber aktuelle und erfolgreich umgesetzte Projekte.</li>
		</ul>
       
       </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header collapse-head" id="headingTwo" >
      <div class="mb-0" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
        <button class="btn btn-link collapsed font-weight-bold" >
          <span>Was sind Projekte?</span>
        </button>
      </div>
    </div>
    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
      <div class="card-body collapse-body">
        
        <ul>
  			<li>Projekte sind Ideen, Anregungen oder Visionen zu Vorhaben in Mosbach, die von Ihnen als Mosbacher B�rgerinnen und B�rgern vorgeschlagen werden k�nnen.</li>
  			<li >Um ein Projekt einzureichen, muss ein Projektantrag ausgef�llt werden, welcher nach Pr�fung eines Verwaltungsmitarbeiters bzgl. formalen Aspekten ver�ffentlicht wird.</li>
  			
		</ul>
        
        </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header collapse-head" id="headingThree" >
      <div class="mb-0" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
        <button class="btn btn-link btn-block collapsed font-weight-bold" >
          <span>Wie geht es nach der Ver�ffentlichung des Projektantrages weiter?</span> 
        </button>
      </div>
    </div>
    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordion">
      <div class="card-body collapse-body">
        <ul>
  			<li>Die Stadtverwaltung pr�ft den Projektantrag auf formale Aspekte und Vollst�ndigkeit. Ist dies gegeben wird dieser ver�ffentlicht.</li>
  			<li>Nun geht es um das Werben f�r Ihr Projekt!</li>
  			<li>Ab 360 Unterst�tzungen muss der Gemeinderat den Projektantrag innerhalb der darauffolgenden 3 Monate in einer Gemeinderatssitzung thematisieren.</li>
  			<li>Der Gemeinderat pr�ft den Projektantrag inhaltlich und erkl�rt ihn f�r zul�ssig oder unzul�ssig gem. �20b GemO BW. Der Gemeinderat, die jeweiligen Fraktionen oder auch einzelnen Abgeordnete haben dann die M�glichkeit sich zu verschiedenen Themen zu positionieren und entsprechend Ihr Projekt zu kommentieren.</li>
  			<li>Bei jedem Vorgang werden Sie entsprechend via E-Mail informiert, sodass Sie immer Kenntnis vom aktuellen Stand ihres Projektes haben.</li>
		</ul>
        </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header collapse-head" id="headingFour" >
      <div class="mb-0" data-toggle="collapse" data-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
        <button class="btn btn-link collapsed font-weight-bold" >
          <span>Was sind Abstimmungen?</span>
        </button>
      </div>
    </div>
    <div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-parent="#accordion">
      <div class="card-body collapse-body">
        
        <ul>
  			<li>Vorgeschlagene Projekte k�nnen von angemeldeten B�rgerinnen und B�rgern nach formaler Freigabe und Ver�ffentlichung unterst�tzt werden.</li>
  			<li >Unterst�tzt werden kann jedes Projekt von jeder Mosbacher B�rgerin und von jedem Mosbacher B�rger genau einmal.</li>
  			<li>Werben Sie also f�r Ihr Projekt!</li>
  			<br>
  			<img src="https://i.ibb.co/NnYGXvT/Wie-unterst-tze-ich-ein-Projekt.png" width="100%" height="100%"> 
		</ul>
        
        </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header collapse-head" id="headingFive" >
      <div class="mb-0" data-toggle="collapse" data-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
        <button class="btn btn-link collapsed font-weight-bold" >
          <span>Wie unterst�tze ich Projekte?</span>
        </button>
      </div>
    </div>
    <div id="collapseFive" class="collapse" aria-labelledby="headingFive" data-parent="#accordion">
      <div class="card-body collapse-body">
        
        <ul>
  			<li>Neben den Projekten gibt es auch Abstimmungen, die ein Stimmungsbild der B�rgerinnen und B�rger dem Gemeinderat liefern.</li>
  			<li >�ber ausgew�hlte Themen k�nnen die B�rgerinnen und B�rger �ber einen ausgew�hlten Zeitraum dem Gemeinderat Feedback geben und somit aktiv st�dtische Vorhaben gestalten.</li>
  			<li>Die Abstimmungen werden vom Gemeinderat, von Fraktionen des Gemeinderats oder auch von einzelne Abgeordneten zu ausgew�hlten Themen erstellt.</li>
		</ul>
        
        </div>
    </div>
  </div>
  
</div>
</body>
</html>