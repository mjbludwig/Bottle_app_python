<style>
 .header {
    text-align: center;
    margin: auto;
    max-width: 600px;
    color: #064A04;
    text-shadow: 2px 2px 2px #FFFFFF;
    padding: 10px;
}
.header2 {
	text-align: center;
	max-width: 500px;
	margin: auto;
	margin-top: 20%;
	color: #064A04;
        text-shadow: 2px 2px 8px #FFFFFF;
	padding: 10px;
	border: 3px solid #1B8422;
	background: rgba(190, 218, 189, .6);
	border-radius: 40px;	
}
.button {
    background-color: #4CAF50;
    border: none;
    color: white;
    padding: 15px 15px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 14px;
    margin: 4px 2px;
    cursor: pointer;
    -webkit-transition-duration: 0.4s;
    transition-duration: 0.4s;
}

.button1:hover {
    box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
}
body {
	background-image: url({{backGround}});
	background-repeat: no-repeat;
	background-size: cover;
}

input[type=text] {
	padding: 12px 12px;
	margin: auto;
	box-sizing: border-box;
}
</style>
<body>
<div class="header">
	<h1>Welcome to the Engaging Cluster account manager</h1>
</div>
<div class="header2"><h2>What group are you apart of?</h2>
	<form action="/groups" method="post">
		<input type="text" name="groupName">
		<button class="button button1">Go</button>
	%if error == "noName":
	<h3>Please enter a group name</h3>
	%elif error == "noGroup":
	<h3>There is no group with that name</h3>
	%elif error == "noUsers":
	<h3>There are no users in that group. Additions must be made administratively.</h3>
	%end
		<!-- <input type="submit" name="goButton" value="go!"> -->
	</form>
</div>
</body>
