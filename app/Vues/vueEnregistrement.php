<!-- Titre de la page -->
<?php $this->titre = "Enregistrement"; ?>

<?php echo $messagePassesDifferents ?>
<?php if (!empty($erreur)) {
  foreach ($erreur as $key => $text) {
    echo $text;
    echo "<br>";
  }
} ?>

<div id="body">
    <div class="row">

        <div id="background-image" class="col-xs-hide col-sm-4 col-md-7 col-lg-9"></div>

        <div id="form-container" class="col-xs-12 col-sm-8 col-md-5 col-lg-3">
            <h1>Créer un compte</h1>
            <form action="">
                <label type="prenom">Prénom:</label>
                <input type="text" name="prenom" id="prenom"></br>
                <label for="nom">Nom:</label>
                <input type="text" name="nom" id="nom"></br>
                <label for="mail">Adresse mail:</label>
                <input type="text" name="mail" id="mail"></br>
                <label for="mdp">Mot de passe:</label>
                <input type="password" name="passe" id="mdp"
                       placeholder="10 caractères minimum"></br>
                <label for="mdp2">Répeter mot de passe:</label>
                <!-- Penser à tester si le mdp est identique-->
                <input type="password" name="passe2" id="mdp2"></br>
                <label for="code">Code d'inscription:</label>
                <input type="text" name="valider" id="code"></br>

                <input id="submit-button" type="submit" value="valider">
            </form>
        </div>

    </div>
</div>