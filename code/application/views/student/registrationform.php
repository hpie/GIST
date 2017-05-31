<?php // render fields & system message using Form Builder library ?>
<?php echo $form->open(); ?>

	<?php echo $form->messages(); ?>
	
	<?php echo $form->bs3_text('Student ID', 'student_id'); ?>
	<?php echo $form->bs3_text('First Name', 'first_name'); ?>
	<?php echo $form->bs3_text('Last Name', 'last_name'); ?>
	<?php echo $form->bs3_text('First Name', 'first_name'); ?>
	<?php echo $form->bs3_text('Last Name', 'last_name'); ?>
	
	<?php echo $form->bs3_text('Gender', 'gender'); ?>
	<?php echo $form->bs3_text('Phone', 'contact_phone'); ?>
	<?php echo $form->bs3_Email('Email', 'email'); ?>
	
	<?php echo $form->bs3_Email('Date of Birth', 'date_of_birth'); ?>
	
	<fieldset>
 		<legend>Corrospondance Address</legend>
	<?php echo $form->bs3_text('Address 1', 'current_address_line1'); ?>
	<?php echo $form->bs3_text('Address 2', 'current_address_line1'); ?>
	<?php echo $form->bs3_text('City', 'current_address_city'); ?>
	<?php echo $form->bs3_text('Distt.', 'current_address_dist'); ?>
	<?php echo $form->bs3_text('State', 'current_address_state'); ?>
	<?php echo $form->bs3_text('Post Code', 'current_address_pincode'); ?>
	</fieldset>
	
	<fieldset>
 		<legend>Permanent Address</legend>
	<?php echo $form->bs3_text('Address 1', 'permanent_address_line1'); ?>
	<?php echo $form->bs3_text('Address 2', 'permanent_address_line1'); ?>
	<?php echo $form->bs3_text('City', 'permanent_address_city'); ?>
	<?php echo $form->bs3_text('Distt.', 'permanent_address_dist'); ?>
	<?php echo $form->bs3_text('State', 'permanent_address_state'); ?>
	<?php echo $form->bs3_text('Post Code', 'permanent_address_pincode'); ?>
	</fieldset>
	
	<?php echo $form->bs3_text('Center Opted', 'center_code'); ?>
	<?php echo $form->bs3_text('Course Opted', 'course_code'); ?>
	<?php echo $form->bs3_text('Admission Date', 'admission_dt'); ?>
	<?php echo $form->bs3_text('Admission Status', 'enquiry_status'); ?>
	
	<?php echo $form->bs3_textarea('Remarks', 'message'); ?>
	
	<p><?php echo $form->field_recaptcha(); ?></p>
	
	<?php echo $form->bs3_submit(); ?>

<?php echo $form->close(); ?>