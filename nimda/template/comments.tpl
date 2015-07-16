<div id="main">
    <div class="header">
        <h1><?php $this->show('h1') ?></h1>
        <h2><?php $this->show('h2') ?></h2>
    </div>
    <div class="content"> 	 
    	 <table class="table">
		    <thead>
		        <tr>
		            <th>#</th>
		            <th>Author</th>
                    <th>Page</th>
                    <th>Date</th>
                    <th>Update</th>
                    <th>Active</th>
		            <th>Edit</th>
		            <th>Delete</th>
		        </tr>
		    </thead>
		    <tbody>
		        <?php foreach ($this->viewData->comments as $key => $value) : ?>
		        <tr>          
		            <td><?php $this->show($value, 'com_id')      ?></td>
		            <td><?php $this->show($value, 'com_author')    ?></td>
                    <td><?php $this->show($value, 'post_id')    ?></td>
                    <td><?php $this->show($value, 'com_date')    ?></td>
                    <td><?php $this->show($value, 'com_update')    ?></td>
                    <td><?php $this->show($value, 'com_active')    ?></td>
		            <td>
		                <a class="pinnackl-button pinnackl-button-primary"
		                href="<?php $this->show('siteurl')?>nimda/comments/edit/<?php $this->show($value, 'com_id')	?>">Edit&nbsp;&#9998;</a>
		            </td>
		            <td>
                        <a class="pinnackl-button pinnackl-button-error"
                        href="<?php $this->show('siteurl')?>nimda/comments/delete/<?php $this->show($value, 'com_id')?>">Delete&nbsp;&#10008;</a>
                    </td>
		        </tr>
		        <?php endforeach; ?>
		    </tbody>
		</table>
    </div>
</div>
<script src="/pinnacklpress/nimda/template/js/form.js"></script>
<script>
Sophwork.ready(function(){
    (function(){
        var e = window.location.href;
        var s = e.split('/');
        var l = s.length;

        if(s.indexOf('delete') != -1 && s.indexOf('delete') == l-2){
            if(confirm('Are you sure ?\nYou want to delete this comment')){
                window.location = Sophwork.getUrl() + "nimda/options.php";
            }
            else{
                window.location = Sophwork.getUrl() + "nimda/comments";
            }
        }
    })();
});
</script>
	