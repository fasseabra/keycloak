<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>${msg("loginTitle")}</title>
  <link rel="stylesheet" href="${url.resourcesPath}/css/login.css">
</head>
<body>
  <div class="login-container">
    <div class="login-card">
      <h1>ACESSA.UEMS</h1>
      <img src="${url.resourcesPath}/img/uems_vertical.png" alt="Logo UEMS" style="width: 150px;">
      <form id="kc-form-login" action="${url.loginAction}" method="post">
        <label for="username">Usuário</label>
        <input type="text" id="username" placeholder="Digite o seu CPF ou usuário" name="username" required>

        <label for="password">Senha</label>
        <input type="password" id="password" placeholder="Digite sua senha" name="password" required>

        <input type="submit" value="Entrar">
      </form>
    </div>
  </div>
</body>
</html>
