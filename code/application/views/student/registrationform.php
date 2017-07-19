<?php // render fields & system message using Form Builder library ?>

<div class="col-sm-6 col-sm-offset-3 form-box">
<?php echo $form->open(); ?>

	<fieldset>	
		<div class="form-top">
		    <div class="form-top-left">
		    <h3>Step 1 / 5</h3>
		    	<p>Tell us about you:</p>
		    </div>
		    <div class="form-top-right">
		    	<i class="fa fa-user">1</i>
		    </div>
	    </div>
	    
	    <div class="form-bottom">
			<?php echo $form->messages(); ?>	
			<?php echo $form->bs3_text('Student ID', 'student_id'); ?>
			<?php echo $form->bs3_text('First Name', 'first_name'); ?>
			<?php echo $form->bs3_text('Middle Name', 'middle_name'); ?>
			<?php echo $form->bs3_text('Last Name', 'last_name'); ?>
			
				<div class="form-group">
					<label for="centers">Gender</label>
						<div>
							<label class="checkbox-inline">
								Male <input type="radio" name="gender" value="M">
							</label>
							<label class="checkbox-inline">
								Female <input type="radio" name="gender" value="F">
							</label>
							<label class="checkbox-inline">
								Other <input type="radio" name="gender" value="O">
							</label>
						</div>
				</div>
				
			<?php echo $form->bs3_text('Phone', 'contact_phone'); ?>
			<?php echo $form->bs3_Email('Email', 'registered_email'); ?>
		
			
				<div class="form-group">
					<label for="date_of_birth">Date of Birth</label>
						<div class='input-group date' id='dob_datetimepicker'>
					    	<input type='text' class="form-control" name="date_of_birth" id="date_of_birth"/>
								<span class="input-group-addon">
									<span class="glyphicon glyphicon-calendar"></span>
								</span>
						</div>
						<script type="text/javascript">
							$(function () {
								$('#dob_datetimepicker').datetimepicker( {
									format: 'YYYY-MM-DD'                     	       
								});
							});
						</script>
				</div>
				
				<button type="button" class="btn btn-next">Next</button>
		 </div>	 		
	</fieldset>
	
	<fieldset>
		<div class="form-top">
		    <div class="form-top-left">
		    <h3>Step 2 / 5</h3>
		    	<p>Abuot your family:</p>
		    </div>
		    <div class="form-top-right">
		    	<i class="fa fa-user">2</i>
		    </div>
	    </div>
	    
	    <div class="form-bottom">
		<?php echo $form->bs3_text('Father First Name', 'father_first_name'); ?>
		<?php echo $form->bs3_text('Father Middle Name', 'father_middle_name'); ?>
		<?php echo $form->bs3_text('Father Last Name', 'father_last_name'); ?>
	
		<?php echo $form->bs3_text('Mother First Name', 'mother_first_name'); ?>
		<?php echo $form->bs3_text('Mother Middle Name', 'mother_middle_name'); ?>
		<?php echo $form->bs3_text('Mother Last Name', 'mother_last_name'); ?>
		
		<button type="button" class="btn btn-previous">Previous</button>
		<button type="button" class="btn btn-next">Next</button>
		</div>	
	</fieldset>
		
	<fieldset>
		<div class="form-top">
		    <div class="form-top-left">
		    <h3>Step 3 / 5</h3>
		    	<p>Where you live:</p>
		    </div>
		    <div class="form-top-right">
		    	<i class="fa fa-user">3</i>
		    </div>
	    </div>
	    
	    <div class="form-bottom">
 		
		<?php echo $form->bs3_text('Address 1', 'current_address_line1'); ?>
		<?php echo $form->bs3_text('Address 2', 'current_address_line2'); ?>
		<?php echo $form->bs3_text('City', 'current_address_city'); ?>
		<?php echo $form->bs3_text('Distt.', 'current_address_dist'); ?>
		<?php echo $form->bs3_text('State', 'current_address_state'); ?>
		<?php echo $form->bs3_text('Post Code', 'current_address_pincode'); ?>
	
		<button type="button" class="btn btn-previous">Previous</button>
		<button type="button" class="btn btn-next">Next</button>
		</div>
	</fieldset>
	
	<fieldset>
		<div class="form-top">
		    <div class="form-top-left">
		    <h3>Step 4 / 5</h3>
		    	<p>Where you are from:</p>
		    </div>
		    <div class="form-top-right">
		    	<i class="fa fa-user">4</i>
		    </div>
	    </div>
	    
	    <div class="form-bottom">
 		
		<?php echo $form->bs3_text('Address 1', 'permanent_address_line1'); ?>
		<?php echo $form->bs3_text('Address 2', 'permanent_address_line2'); ?>
		<?php echo $form->bs3_text('City', 'permanent_address_city'); ?>
		<?php echo $form->bs3_text('Distt.', 'permanent_address_dist'); ?>
		<?php echo $form->bs3_text('State', 'permanent_address_state'); ?>
		<?php echo $form->bs3_text('Post Code', 'permanent_address_pincode'); ?>
	
		<button type="button" class="btn btn-previous">Previous</button>
		<button type="button" class="btn btn-next">Next</button>
		</div>
	</fieldset>
	
	<fieldset>
		<div class="form-top">
		    <div class="form-top-left">
		    <h3>Step 5 / 5</h3>
		    	<p>Your assciation with us:</p>
		    </div>
		    <div class="form-top-right">
		    	<i class="fa fa-user">5</i>
		    </div>
	    </div>
	    
	    <div class="form-bottom">
		<?php if ( !empty($centers) ): ?>
			<div class="form-group">
				<label for="atcs">Center Opted</label>
				<div>
				<select name="center_code" id="center_code">
					<option value="">Choose an Center</option>
				<?php foreach ($centers as $center): ?>
					<option value="<?php echo $center->center_code; ?>"> <?php echo $center->center_name; ?> </option>
				<?php endforeach; ?>
				</select>
				</div>
			</div>
			
	<?php endif; ?>
	
	<?php if ( !empty($courses) ): ?>
		<div class="form-group">
			<label for="courses">Course Opted</label>
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
			<label for="admission_dt">Admission Date</label>
				<div class='input-group date' id='admission_datetimepicker'>
			    	<input type='text' class="form-control" name="admission_dt" id="admission_dt"/>
						<span class="input-group-addon">
							<span class="glyphicon glyphicon-calendar"></span>
						</span>
				</div>
				<script type="text/javascript">
					$(function () {
						$('#admission_datetimepicker').datetimepicker( {
							format: 'YYYY-MM-DD'                     	       
						});
					});
				</script>
		</div>	
	
		<div class="form-group">
			<label for="centers">Admission Status</label>
				<div>
					<select name="student_status" id="student_status">
						<option value="">-- Choose a Value --</option>
						<option value="E">Enrolled</option>
						<option value="D">Droped Out</option>
					</select>
				</div>
		</div>
		
	
	<?php echo $form->bs3_textarea('Remarks', 'message'); ?>
	
	
	<p><?php echo $form->field_recaptcha(); ?></p>
	<button type="button" class="btn btn-previous">Previous</button>
	<?php echo $form->bs3_submit(); ?>
	</div>
	</fieldset>
	
<p>&nbsp;</p>

<?php echo $form->close(); ?>

</div>
<!--

                   

                        <div class="col-sm-6 col-sm-offset-3 form-box">
                        	
                        	<form role="form" action="" method="post" class="registration-form">
                        		
                        		<fieldset>
		                        	<div class="form-top">
		                        		<div class="form-top-left">
		                        			<h3>Step 1 / 3</h3>
		                            		<p>Tell us who you are:</p>
		                        		</div>
		                        		<div class="form-top-right">
		                        			<i class="fa fa-user"></i>
		                        		</div>
		                            </div>
		                            <div class="form-bottom">
				                    	<div class="form-group">
				                    		<label class="sr-only" for="form-first-name">First name</label>
				                        	<input type="text" name="form-first-name" placeholder="First name..." class="form-first-name form-control" id="form-first-name">
				                        </div>
				                        <div class="form-group">
				                        	<label class="sr-only" for="form-last-name">Last name</label>
				                        	<input type="text" name="form-last-name" placeholder="Last name..." class="form-last-name form-control" id="form-last-name">
				                        </div>
				                        <div class="form-group">
				                        	<label class="sr-only" for="form-about-yourself">About yourself</label>
				                        	<textarea name="form-about-yourself" placeholder="About yourself..." 
				                        				class="form-about-yourself form-control" id="form-about-yourself"></textarea>
				                        </div>
				                        <button type="button" class="btn btn-next">Next</button>
				                    </div>
			                    </fieldset>
			                    
			                    <fieldset>
		                        	<div class="form-top">
		                        		<div class="form-top-left">
		                        			<h3>Step 2 / 3</h3>
		                            		<p>Set up your account:</p>
		                        		</div>
		                        		<div class="form-top-right">
		                        			<i class="fa fa-key"></i>
		                        		</div>
		                            </div>
		                            <div class="form-bottom">
				                        <div class="form-group">
				                        	<label class="sr-only" for="form-email">Email</label>
				                        	<input type="text" name="form-email" placeholder="Email..." class="form-email form-control" id="form-email">
				                        </div>
				                        <div class="form-group">
				                    		<label class="sr-only" for="form-password">Password</label>
				                        	<input type="password" name="form-password" placeholder="Password..." class="form-password form-control" id="form-password">
				                        </div>
				                        <div class="form-group">
				                        	<label class="sr-only" for="form-repeat-password">Repeat password</label>
				                        	<input type="password" name="form-repeat-password" placeholder="Repeat password..." 
				                        				class="form-repeat-password form-control" id="form-repeat-password">
				                        </div>
				                        <button type="button" class="btn btn-previous">Previous</button>
				                        <button type="button" class="btn btn-next">Next</button>
				                    </div>
			                    </fieldset>
			                    
			                    <fieldset>
		                        	<div class="form-top">
		                        		<div class="form-top-left">
		                        			<h3>Step 3 / 3</h3>
		                            		<p>Social media profiles:</p>
		                        		</div>
		                        		<div class="form-top-right">
		                        			<i class="fa fa-twitter"></i>
		                        		</div>
		                            </div>
		                            <div class="form-bottom">
				                    	<div class="form-group">
				                    		<label class="sr-only" for="form-facebook">Facebook</label>
				                        	<input type="text" name="form-facebook" placeholder="Facebook..." class="form-facebook form-control" id="form-facebook">
				                        </div>
				                        <div class="form-group">
				                        	<label class="sr-only" for="form-twitter">Twitter</label>
				                        	<input type="text" name="form-twitter" placeholder="Twitter..." class="form-twitter form-control" id="form-twitter">
				                        </div>
				                        <div class="form-group">
				                        	<label class="sr-only" for="form-google-plus">Google plus</label>
				                        	<input type="text" name="form-google-plus" placeholder="Google plus..." class="form-google-plus form-control" id="form-google-plus">
				                        </div>
				                        <button type="button" class="btn btn-previous">Previous</button>
				                        <button type="submit" class="btn">Sign me up!</button>
				                    </div>
			                    </fieldset>
		                    
		                    </form>
		                    
                        </div>

-->

