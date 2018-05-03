<h1>Here are the users for group {{groupName.capitalize()}}</h1>

<p>{{printUsers}}</p>
<p>would you like to make a change?</p>
<form action="/changes" method="post">
	<input type="radio" name="yes" value="yesRad">yes<br>
	<input type="radio" name="no" value="noRad">no<br>
	<input type="submit" name="submit" value="submit">
</form>
