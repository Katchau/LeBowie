<div class="collapse-group">
	{assign "size" 300}
	{if strlen($description) < $size}
		<div class="smallText">
			{$description}
		</div>
	{else}
		{assign "cut" substr($description, $size, strlen($description))}
		{assign "pos" strpos($cut, ' ') + $size}
		{if $pos == $size}
			<span class="smallText">
				{$description}
			</span>
		{else}
			<span class="smallText">
				{substr($description,0,$pos)}
			</span>
			<span class="collapse">
				{substr($description,$pos,strlen($description))}
			</span>
			<p><a class="viewmore" href="#">View more..</a></p>
		{/if}
	{/if}
</div>
