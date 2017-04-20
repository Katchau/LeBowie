<div class="collapse-group">
	{assign "size" 300}
	{if strlen($description) < $size}
		<p class="smallText">
			{$description}
		</p>
	{else}
		{assign "cut" substr($description, $size, strlen($description))}
		{assign "pos" strpos($cut, ' ') + $size}
		{if $pos == $size}
			<p class="smallText">
				{$description}
			</p>
		{else}
			<p class="smallText">
				{substr($description,0,$pos)}
			</p>
			<p class="collapse">
				{substr($description,$pos,strlen($description))}
			</p>
			<p><a class="viewmore" href="#">View more..</a></p>
		{/if}
	{/if}
</div>