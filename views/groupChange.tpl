<style>
.container {
	text-align: center;
	margin: auto;
	padding-bottom: 50px;
}

.header {
	text-shadow: 2px 2px 2px #FFFFFF;
	margin: auto;
	margin-top: 3%;
	margin-bottom: 3%;
	max-width: 600px;
	border: 3px solid #1B8422;
        background: rgba(190, 218, 189, .6);
        border-radius: 40px;
	padding: 20px;
}

body {
        background-image: url({{backGround}});
        background-repeat: no-repeat;
        background-size: cover;
}
table {
	display: inline-block;
	border: 5px solid #073A05;
        border-collapse: collapse;

}

td {
	border: 2px solid #1B8422;
	border-collapse: collapse;
	padding: 6px;
	text-align: center;
}
tr:nth-child(even) {
	background-color: #7EEF86;
}
tr:nth-child(odd) {
	background-color: #D3ECD2;
}
.button {
    box-shadow: 0 12px 16px 0 rgba(255,255,255,0.24),0 17px 50px 0 rgba(255,255,255,0.19);
    background-color: #4CAF50; 
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
    -webkit-transition-duration: 0.4s;
    transition-duration: 0.4s;
}

.button1:hover {
    box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
}
</style>
<div class="container">
<div class="header"><h1>Please enter your changes below</h1></div>
<table>

<form action="/changes-made" method="post">
%for users in printUsers:
	<tr>
	<td><b>{{users}}</b></td> 
	<td style="font-size:80%"><input type="radio" name="{{users}}" value="deleteAll"/>
	Remove user and their files</td>
	<td style="font-size:80%"><input type="radio" name="{{users}}" value="save" checked="checked"/>
	No change</td>
	<td style="font-size:80%"><input type="radio" name="{{users}}" value="suspend"/>Suspend account</td>
	<td style="font-size:80%"><input type="radio" name="{{users}}" value="delete"/>Delete user (keep files)
	</tr>
%end
</table>
<br><br><br>
	<button class="button button1">
	Submit
	</button>
	<!-- <input style="width: 30%; height: 10%; font-size:150%;" type="submit" name="submit" value="submit">  -->
</form>
</div>
