<footer class="main-footer">
	<?php if (ENVIRONMENT=='development'): ?>
		<div class="pull-right hidden-xs">
			GIST Admin Version: <strong><?php echo CI_BOOTSTRAP_VERSION; ?></strong>, 
			CodeIgniter Version: <strong><?php echo CI_VERSION; ?></strong>, 
			Elapsed Time: <strong>{elapsed_time}</strong> seconds, 
			Memory Usage: <strong>{memory_usage}</strong>
		</div>
	<?php endif; ?>
	<strong>&copy; <?php echo date('Y'); ?></strong> All rights reserved.
</footer>