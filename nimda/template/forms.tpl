<div id="main">
    <div class="header">
        <h1><?php $this->show('h1') ?></h1>
        <h2><?php $this->show('h2-create') ?></h2>
    </div>
    <div class="content">
    	 <form  class="pinnackl-form" action="options.php" method="post">
    	 	<div id="field-container">
    	 		<input type="text" name="form-name" placeholder="form name" class="pinnackl-input-1-2" id="field-1" required>
    	 	</div>
    	 	<input class="pinnackl-button pinnackl-input-1-2 pinnackl-button-primary" type="button" name="add-field" id="add-field" value="Add field" onClick="addField()">
    	 	<input class="pinnackl-button pinnackl-input-1-2 pinnackl-button-primary" type="submit" name="_formulaire" value="Submit">
    	 </form>
    	 <h2><?php $this->show('h2-list') ?></h2>
    	 <table class="table">
		    <thead>
		        <tr>
		            <th>#</th>
		            <th>Name</th>
		            <th>Edit</th>
		            <th>Delete</th>
		        </tr>
		    </thead>
		    <tbody>
		        <?php foreach ($this->viewData->forms as $key => $value) : ?>
		        <tr>          
		            <td><?php $this->show($value, 'form_id')      ?></td>
		            <td><?php $this->show($value, 'form_name')    ?></td>
		            <td>
		                <a class="pinnackl-button pinnackl-button-primary"
		                href="<?php $this->show('siteurl')?>nimda/forms/edit/<?php $this->show($value, 'form_name')		?>">Edit</a>
		            </td>
		            <td>
                        <a class="pinnackl-button pinnackl-button-error"
                        href="<?php $this->show('siteurl')?>nimda/pages/delete/<?php $this->show($value, 'form_name')?>">Delete</a>
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
            if(confirm('Are you sure ?\nYou want to delete this form')){
                window.location = Sophwork.getUrl() + "nimda/options.php";
            }
            else{
                window.location = Sophwork.getUrl() + "nimda/forms";
            }
        }
    })();
});
</script>
	