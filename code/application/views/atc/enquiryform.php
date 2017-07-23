<?php // render fields & system message using Form Builder library ?>
<?php echo $form->open(); ?>

<div class="col-sm-6 col-sm-offset-3 form-box">
	<?php echo $form->messages(); ?>
	
	<fieldset>
	<?php echo $form->bs3_text('First Name', 'first_name'); ?>
	<?php echo $form->bs3_text('Last Name', 'last_name'); ?>
	
	<?php if ( !empty($atcs) ): ?>
			<div class="form-group">
				<label for="atcs">ATC</label>
				<div>
				<select name="atc_code" id="atc_code">
					<option value="">Choose an ATC</option>
				<?php foreach ($atcs as $atc): ?>
					<option value="<?php echo $atc->atc_code; ?>"> <?php echo $atc->atc_name; ?> </option>
				<?php endforeach; ?>
				</select>
				</div>
			</div>
			
	<?php endif; ?>
	
	<?php if ( !empty($courses) ): ?>
		<div class="form-group">
			<label for="courses">Intended Course</label>
			<div>
			<select name="intended_course" id="intended_course">
			<option value="">Choose a Course</option>
			<?php foreach ($courses as $course): ?>
				<option value="<?php echo $course->course_code; ?>"> <?php echo $course->course_name; ?> </option>
			<?php endforeach; ?>
			</select>
			</div>
		</div>
	<?php endif; ?>

		<div class="form-group">
			<label for="enquiry_dt">Enquiry Date</label>
				<!-- <div class='input-group date' id='datetimepicker1'>  -->
			    	<input type='text' class="form-control" name="enquiry_dt" id="enquiry_dt"/>
						<!-- <span class="input-group-addon">
							<span class="glyphicon glyphicon-calendar"></span>
						</span>  -->
				<!-- </div>  -->
				<script type="text/javascript">
				$( function() {
				    $( "#enquiry_dt" ).datepicker({
				      changeMonth: true,
				      dateFormat: 'yy-mm-dd'
				    });
				  } );
				</script>
		</div>	
	
		<div class="form-group">
			<label for="centers">Enquiry Status</label>
				<div>
					<select name="enquiry_status" id="enquiry_status">
						<option value="">-- Choose a Value --</option>
						<option value="E">Enquired</option>
						<option value="P">Prospectus Purchased</option>
					</select>
				</div>
		</div>
			
	<?php echo $form->bs3_text('Prospectus Number', 'prospectus_number'); ?>
	
	<?php echo $form->bs3_Email('Email', 'enquiry_email'); ?>
	
	<?php echo $form->bs3_textarea('Notes', 'enquiry_notes'); ?>
	
	</fieldset>
	
	<p><?php echo $form->field_recaptcha(); ?></p>
	
	<?php echo $form->bs3_submit(); ?>
	
<p>&nbsp;</p>
</div>
<?php echo $form->close(); ?>

