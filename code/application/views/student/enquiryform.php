<?php // render fields & system message using Form Builder library ?>
<?php echo $form->open(); ?>

	<?php echo $form->messages(); ?>
	<?php echo $form->bs3_text('First Name', 'first_name'); ?>
	<?php echo $form->bs3_text('Last Name', 'last_name'); ?>
	<?php echo $form->bs3_text('First Name', 'first_name'); ?>
	<?php echo $form->bs3_text('Last Name', 'last_name'); ?>
	<?php echo $form->bs3_text('Intended Course', 'intended_course'); ?>
	<?php echo $form->bs3_text('Enquiry Date', 'enquiry_dt'); ?>
	<?php echo $form->bs3_text('Enquiry Status', 'enquiry_status'); ?>
	<?php echo $form->bs3_text('Prospectus Payment', 'prospectus_number'); ?>
	<?php echo $form->bs3_text('Prospectus Payment', 'prospectus_payment'); ?>
	<?php echo $form->bs3_Email('Email', 'email'); ?>
	<?php echo $form->bs3_textarea('Message', 'message'); ?>
	
	<p><?php echo $form->field_recaptcha(); ?></p>
	
	<?php echo $form->bs3_submit(); ?>

<?php echo $form->close(); ?>