<?php // render fields & system message using Form Builder library ?>
<?php echo $form->open(); ?>

	<?php echo $form->messages(); ?>
	<?php echo $form->bs3_text('First Name', 'first_name'); ?>
	<?php echo $form->bs3_text('Last Name', 'last_name'); ?>
	<?php // print_r($centers); ?>
	<?php if ( !empty($centers) ): ?>
			<div class="form-group">
				<label for="centers">Center</label>
				<div>
				<select>
					<option value="">Choose a Center</option>
				<?php foreach ($centers as $center): ?>
					<option value="<?php echo $center->center_code; ?>"> <?php echo $center->center_name; ?> </option>
				<?php endforeach; ?>
				</select>
				</div>
				
			</div>
			
	<?php endif; ?>
	
	<?php echo $form->bs3_text('Student ID', 'student_id'); ?>
	<?php echo $form->bs3_text('Intended Course', 'intended_course'); ?>
	
	<?php if ( !empty($courses) ): ?>
			<div class="form-group">
				<label for="courses">Course</label>
				<div>
				<select>
				<option value="">Choose a Course</option>
				<?php foreach ($courses as $course): ?>
					<option value="<?php echo $course->course_code; ?>"> <?php echo $course->course_name; ?> </option>
				<?php endforeach; ?>
				</select>
				</div>
			</div>
	<?php endif; ?>
					
	<?php echo $form->bs3_text('Enquiry Date', 'enquiry_dt'); ?>
		 <div class="form-group">
		 		<label for="enquiry_dt">Enquiry Date</label>
				<div class='input-group date' id='datetimepicker1'>
                   	<input type='text' class="form-control" name="enquiry_dt" id="enquiry_dt"/>
                   	<span class="input-group-addon">
                       	<span class="glyphicon glyphicon-calendar"></span>
                	</span>
                </div>
         <script type="text/javascript">
         $(function () {
                $('#datetimepicker1').datetimepicker( {
                	format: 'DD-MM-YYYY'                     	       
                });
            });
         </script>
                
		</div>	
	
	<?php echo $form->bs3_text('Enquiry Status', 'enquiry_status'); ?>
	<?php echo $form->bs3_text('Prospectus Payment', 'prospectus_number'); ?>
	<?php echo $form->bs3_text('Prospectus Payment', 'prospectus_payment'); ?>
	<?php echo $form->bs3_Email('Email', 'email'); ?>
	<?php echo $form->bs3_textarea('Message', 'message'); ?>
	
	<p><?php echo $form->field_recaptcha(); ?></p>
	
	<?php echo $form->bs3_submit(); ?>

<?php echo $form->close(); ?>