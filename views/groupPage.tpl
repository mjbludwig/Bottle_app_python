<h1>Here are the users for group: {{groupName.capitalize()}}</h1>

<style>
.wrapper {
    display: grid;
    grid-template-columns: repeat(6, 1fr);
    grid-gap: 5px;
    grid-auto-rows: minmax(auto, auto)
}
.wrapper > div {
    border: 4px solid #1B8422;
    border-radius: 2px;
    background-color: #7EEF86;
    color: #113F23;
    text-align: center;
    font-size: 1em;
    font-weight: bold;
    padding: 4px;

}
</style>

<div class="wrapper">
%for users in printUsers:
	<div>{{users}}</div>
% end
</div>

<p>would you like to make a change?</p>
<form action="/changes" method="post">
	<input type="radio" name="radioYesNo" value="yes"/>yes<br>
	<input type="radio" name="radioYesNo" value="no" checked="checked"/>no<br><br>
	<input type="submit" name="submit" value="submit"><br>
</form>
