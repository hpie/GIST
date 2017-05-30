<div class="footer">
	<div class="container">
		<?php if (ENVIRONMENT=='development'): ?>
			<p class="pull-right text-muted">
				GIST Version: <strong><?php echo CI_BOOTSTRAP_VERSION; ?></strong>, 
				CodeIgniter Version: <strong><?php echo CI_VERSION; ?></strong>, 
				Elapsed Time: <strong>{elapsed_time}</strong> seconds, 
				Memory Usage: <strong>{memory_usage}</strong>
			</p>
		<?php endif; ?>
		<p class="text-muted">&copy; <strong><?php echo date('Y'); ?></strong> All rights reserved.</p>
	</div>
</div>