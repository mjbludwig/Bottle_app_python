
<style>
body {
        background-image: url({{backGround}});
        background-repeat: no-repeat;
        background-size: cover;
}

.header {
    text-align: center;
    margin: auto;
    max-width: 700px;
    color: #064A04;
    text-shadow: 2px 2px 2px #FFFFFF;
    padding: 10px;
    border: 3px solid #1B8422;
    background: rgba(190, 218, 189, .6);
    border-radius: 40px;

}

.wrapper {
    display: grid;
    padding: 20px;
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

.button {
    background-color: #4CAF50;
    border: none;
    color: white;
    padding: 15px 15px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 14px;
    margin: auto;
    cursor: pointer;
    -webkit-transition-duration: 0.4s;
    transition-duration: 0.4s;
}

.button1:hover {
    box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
}

.container {
  display: inline-block;
  position: relative;
  padding-left: 35px;
  padding-right: 50px;
  margin: auto;
  margin-bottom: 12px;
  cursor: pointer;
  font-size: 22px;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

.container input {
  position: absolute;
  opacity: 0;
}

.checkmark {
  position: absolute;
  top: 0;
  left: 0;
  height: 25px;
  width: 25px;
  background-color: #5A5A5A;
  border-radius: 50%;
}

.container:hover input ~ .checkmark {
  background-color: #7D7D7D;
}

.container input:checked ~ .checkmark {
  background-color: #2196F3;
}

.checkmark:after {
  content: "";
  position: absolute;
  display: none;
}

.container input:checked ~ .checkmark:after {
  display: block;
}

.container .checkmark:after {
  top: 9px;
  left: 9px;
  width: 8px;
  height: 8px;
  border-radius: 50%;
  background: white;
} 
</style>
<div class="header">
<h1>Here are the users for {{groupName.capitalize()}}</h1>
</div>
<div class="wrapper">
%for users in printUsers:
	<div>{{users}}</div>
% end
</div>
<div class="header">
<h1>would you like to make a change?</h1>
<form action="/groups/changes" method="post">
	<label class="container">Yes 
	<input type="radio" name="radioYesNo" value="yes"/>
	<span class="checkmark"></span>
	</label>
	<label class="container">No 
	<input type="radio" name="radioYesNo" value="no" checked="checked"/>
	<span class="checkmark"></span>
	</label>
	<button class="button button1">Submit</button>
</form>
</div>
