
<h3>Welcome, <?php echo $user->first_name.' '.$user->last_name; ?>!</h3>
<h4>You were last seen on,<b> <?php echo (date("F d, Y h:i:s", $user->last_login)); ?></b> </h4>

<a href="auth/logout" class="btn btn-primary">Logout</a>