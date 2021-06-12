#!/bin/bash
yum -y update
yum -y install httpd


myip='curl http://169.254.169.254/latest/meta-data/local-ipv4'
cat <<EOF > /var/www/html/index.html
<html>
  <head>
		<title> Веб сайт Іван Бірюков</title>
		<style type="text/css">
			pp{ font-family: Georgia; line-height: 1.5em;font-size: 15px; text-indent: 1em; color: #ca1414;}
		</style>
	</head>
    <body bgcolor="#526d7e">
    <img src="https://prostir-agency.com.ua/images/Blog/Saitu_nedvizhimosti/1_domik.ua.png" alt="Lamp" width="100%" height="100%">
		<p>
			Создания пользователя ORACLE
		</p>
		<table border=1 width=400 bgcolor="#dde2e6" >
			<tr>
				<td>

					<center><p>Регистрация пользователя для просмотра файлов <p>
					</center>
					<br>
						<div>
							<table border=0	>
								<tr>
									<td width=10></td>
									<td  width=200>
										<form>
											<label for="email" >Адрес электронной почты </label><p>
										</form>
									</td>
									<td>
										<form>
											<input id="email" name="email" type="text"  placeholder="birjukivan@gmail.com" /><p>
										</form>
									</td>
								</tr>
								<tr>
									<td width=10></td>
									<td  width=150>
										<form>
												<label for="password" >Пароль </label><p>
										</form>
									</td>
									<td>
										<form>
											<input id="password" name="password" type="text"  placeholder="Пароль" /><p>
										</form>
									</td>
								</tr>
								<tr>
									<td width=10></td>
									<td  width=150>
										<form>
												<label for="password2" >Повторите пароль </label><p>
										</form>
									</td>
									<td>
										<form>
											<input id="password2" name="password2" type="text"  placeholder="Пароль" /><p>
										</form>
									</td>
								</tr>

							</table>
						</div>
						<br>
						<div>
							<table border=0		>
								<tr>
									<td width=10></td>
									<td  width=200>
										<form>
											<label for="user" >Ваше имя </label><p>
										</form>
									</td>
									<td>
										<form>
											<input id="user" name="username" type="text"  placeholder="" /><p>
										</form>
									</td>
								</tr>
								<tr>
									<td width=10></td>
									<td  width=150>
										<form>
												<label for="phone" >Номер телефона </label><p>
										</form>
									</td>
									<td>
										<form>
											<input id="tel" name="phone" type="tel" pattern="[0-9]{3}-[0-9]{2}-[0-9]{3}"  placeholder="+380660635423" /><p>
										</form>
									</td>
								</tr>
								<tr>
									<td width=10></td>
									<td  width=150>
										<form>
												<label for="country" >Страна</label><p>
										</form>
									</td>
									<td>
										<select>
											<datalist id="country">
												<option >Украина
												<option >Россия
												<option >США
												<option >Япония
											</datalist>
										</select>
										</form>
									</td>
								</tr>
								<tr>
									<td width=10></td>
									<td  width=150>
										<form>
												<label for="col" >Выбор цвета	 </label><p>
										</form>
									</td>
									<td>
										<form>
											<input id="col" name="col" type="color" value="#ff0000"/><p>
										</form>
									</td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td><input type="submit" value="ОТПРАВИТЬ"></td>
								</tr>
							</table>
						</div>
				</td>
			</tr>
		</table>

	</body>
</html>
EOF


sudo service httpd start
chkconfig httpd on
