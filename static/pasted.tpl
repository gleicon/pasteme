<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"> 
<html lang="en"> 
 
<head> 
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"> 
        <title>pasteme</title> 
    <link rel="stylesheet" href="/static/css/main.css" type="text/css" media="screen" charset="utf-8"> 
        
</head> 
 
<body onload=''> 
<div id='topbar'> 
    <h1 style="float: left">|Bottle|Redis|Python|pasteme|</h1> 
</div> 

<div id='content'> 
<h3>Paste your stuff</h3> 
 
<p>Paste your text and share. </p>
<form action='/paste' method='POST'>
<textarea name='code' rows="15" cols="40">{{code}}</textarea> 
<br>
<p> Last changed: {{date}} </p>
<input type='hidden' name='_id' value={{_id}}>
<input type='submit' name='Paste me'> | | <input type='reset'>
</form>
</div> 
<div id='footer'> 
        (c) gleicon 2010  | html template inspired by http://dpaste.com/about/ 
</div> 

</body> 
</html> 
