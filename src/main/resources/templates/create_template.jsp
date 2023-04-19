<!DOCTYPE html>
<html lang="en-US" xmlns:th="http://www.thymeleaf.org">

<head>

  <title>Create Template </title>
  <script src="https://cdn.tiny.cloud/1/wi2575d1rqs2q6nfppd9by62aw82k4bo2ff0yfr2hsh3ern7/tinymce/6/tinymce.min.js"
    referrerpolicy="origin"></script>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
    integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
</head>

<body>


  <div class="container mt-4 p-3 my-5 border border-dark " style="background-color:white">
    <div th:if="${session.msg}">
      <div class="alert alert-success" role="alert" style="text-align:center" th:text="${session.msg}">

      </div>
      <th:block th:text="${#session.removeAttribute('msg')}"></th:block>
    </div>
    <h2> Create Template</h2>
    <form action="#" th:action="@{/addTemplate}" th:object="${template}" method="post">

      <div class="row">
        <div class="col-md-9 mt-2">
          <label><strong>Template Name</strong></label>
          <div>
            <input type="text" th:field="*{templateName}" class="form-control" style="width:135%;" maxlength="200"
              placeholder="Enter Template Name Here" required="required" />
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-md-9 mt-2">
          <label><strong>Header</strong></label>
          <textarea id="body1" th:field="*{header}" style="width:135%; height:300px"></textarea>
          <script>
          tinymce.init({
        	  selector: 'textarea#body1',
        	  plugins: 'image code anchor autolink charmap codesample emoticons image link lists media searchreplace table visualblocks wordcount checklist mediaembed casechange export formatpainter pageembed linkchecker a11ychecker tinymcespellchecker permanentpen powerpaste advtable advcode editimage  tableofcontents footnotes mergetags autocorrect typography inlinecss',
        	  toolbar: 'undo redo | link image | code | blocks fontfamily fontsize | bold italic underline strikethrough | link image media table mergetags | addcomment showcomments | spellcheckdialog a11ycheck typography | align lineheight | checklist numlist bullist indent outdent | emoticons charmap | removeformat',
        	  /* enable title field in the Image dialog*/
        	  image_title: true,
        	  /* enable automatic uploads of images represented by blob or data URIs*/
        	  automatic_uploads: true,
        	  /*
        	    URL of our upload handler (for more details check: https://www.tiny.cloud/docs/configure/file-image-upload/#images_upload_url)
        	    images_upload_url: 'postAcceptor.php',
        	    here we add custom filepicker only to Image dialog
        	  */
        	  file_picker_types: 'image',
        	  /* and here's our custom image picker*/
        	  file_picker_callback: (cb, value, meta) => {
        	    const input = document.createElement('input');
        	    input.setAttribute('type', 'file');
        	    input.setAttribute('accept', 'image/*');

        	    input.addEventListener('change', (e) => {
        	      const file = e.target.files[0];

        	      const reader = new FileReader();
        	      reader.addEventListener('load', () => {
        	        /*
        	          Note: Now we need to register the blob in TinyMCEs image blob
        	          registry. In the next release this part hopefully won't be
        	          necessary, as we are looking to handle it internally.
        	        */
        	        const id = 'blobid' + (new Date()).getTime();
        	        const blobCache =  tinymce.activeEditor.editorUpload.blobCache;
        	        const base64 = reader.result.split(',')[1];
        	        const blobInfo = blobCache.create(id, file, base64);
        	        blobCache.add(blobInfo);

        	        /* call the callback and populate the Title field with the file name */
        	        cb(blobInfo.blobUri(), { title: file.name });
        	      });
        	      reader.readAsDataURL(file);
        	    });

        	    input.click();
        	  },
        	  content_style: 'body { font-family:Helvetica,Arial,sans-serif; font-size:16px }'
        	});

          </script>
        </div>
      </div>

      <div class="row">
        <div class="col-md-9 mt-2">
          <label><strong>Editor</strong></label>
          <textarea id="body" th:field="*{content}" style="width:135%; height:300px"
            placeholder="editor place holder"></textarea>
          <script>
          tinymce.init({
        	  selector: 'textarea#body',
        	  plugins: 'image code anchor autolink charmap codesample emoticons image link lists media searchreplace table visualblocks wordcount checklist mediaembed casechange export formatpainter pageembed linkchecker a11ychecker tinymcespellchecker permanentpen powerpaste advtable advcode editimage  tableofcontents footnotes mergetags autocorrect typography inlinecss',
        	  toolbar: 'undo redo | link image | code | blocks fontfamily fontsize | bold italic underline strikethrough | link image media table mergetags | addcomment showcomments | spellcheckdialog a11ycheck typography | align lineheight | checklist numlist bullist indent outdent | emoticons charmap | removeformat',
        	  /* enable title field in the Image dialog*/
        	  image_title: true,
        	  /* enable automatic uploads of images represented by blob or data URIs*/
        	  automatic_uploads: true,
        	  /*
        	    URL of our upload handler (for more details check: https://www.tiny.cloud/docs/configure/file-image-upload/#images_upload_url)
        	    images_upload_url: 'postAcceptor.php',
        	    here we add custom filepicker only to Image dialog
        	  */
        	  file_picker_types: 'image',
        	  /* and here's our custom image picker*/
        	  file_picker_callback: (cb, value, meta) => {
        	    const input = document.createElement('input');
        	    input.setAttribute('type', 'file');
        	    input.setAttribute('accept', 'image/*');

        	    input.addEventListener('change', (e) => {
        	      const file = e.target.files[0];

        	      const reader = new FileReader();
        	      reader.addEventListener('load', () => {
        	        /*
        	          Note: Now we need to register the blob in TinyMCEs image blob
        	          registry. In the next release this part hopefully won't be
        	          necessary, as we are looking to handle it internally.
        	        */
        	        const id = 'blobid' + (new Date()).getTime();
        	        const blobCache =  tinymce.activeEditor.editorUpload.blobCache;
        	        const base64 = reader.result.split(',')[1];
        	        const blobInfo = blobCache.create(id, file, base64);
        	        blobCache.add(blobInfo);

        	        /* call the callback and populate the Title field with the file name */
        	        cb(blobInfo.blobUri(), { title: file.name });
        	      });
        	      reader.readAsDataURL(file);
        	    });

        	    input.click();
        	  },
        	  content_style: 'body { font-family:Helvetica,Arial,sans-serif; font-size:16px }'
        	});

          </script>
        </div>
      </div>
      <div class="row">
        <div class="col-md-9 mt-2">
          <label><strong>Footer</strong></label>
          <textarea id="body2" th:field="*{footer}" style="width:135%; height:300px"></textarea>
          <script>
          tinymce.init({
        	  selector: 'textarea#body2',
        	  plugins: 'image code anchor autolink charmap codesample emoticons image link lists media searchreplace table visualblocks wordcount checklist mediaembed casechange export formatpainter pageembed linkchecker a11ychecker tinymcespellchecker permanentpen powerpaste advtable advcode editimage  tableofcontents footnotes mergetags autocorrect typography inlinecss',
        	  toolbar: 'undo redo | link image | code | blocks fontfamily fontsize | bold italic underline strikethrough | link image media table mergetags | addcomment showcomments | spellcheckdialog a11ycheck typography | align lineheight | checklist numlist bullist indent outdent | emoticons charmap | removeformat',
        	  /* enable title field in the Image dialog*/
        	  image_title: true,
        	  /* enable automatic uploads of images represented by blob or data URIs*/
        	  automatic_uploads: true,
        	  /*
        	    URL of our upload handler (for more details check: https://www.tiny.cloud/docs/configure/file-image-upload/#images_upload_url)
        	    images_upload_url: 'postAcceptor.php',
        	    here we add custom filepicker only to Image dialog
        	  */
        	  file_picker_types: 'image',
        	  /* and here's our custom image picker*/
        	  file_picker_callback: (cb, value, meta) => {
        	    const input = document.createElement('input');
        	    input.setAttribute('type', 'file');
        	    input.setAttribute('accept', 'image/*');

        	    input.addEventListener('change', (e) => {
        	      const file = e.target.files[0];

        	      const reader = new FileReader();
        	      reader.addEventListener('load', () => {
        	        /*
        	          Note: Now we need to register the blob in TinyMCEs image blob
        	          registry. In the next release this part hopefully won't be
        	          necessary, as we are looking to handle it internally.
        	        */
        	        const id = 'blobid' + (new Date()).getTime();
        	        const blobCache =  tinymce.activeEditor.editorUpload.blobCache;
        	        const base64 = reader.result.split(',')[1];
        	        const blobInfo = blobCache.create(id, file, base64);
        	        blobCache.add(blobInfo);

        	        /* call the callback and populate the Title field with the file name */
        	        cb(blobInfo.blobUri(), { title: file.name });
        	      });
        	      reader.readAsDataURL(file);
        	    });

        	    input.click();
        	  },
        	  content_style: 'body { font-family:Helvetica,Arial,sans-serif; font-size:16px }'
        	});


          </script>



        </div>
      </div>
      <div class="row">
        <div class="col-md-9 my-4">
          <input type="submit" value="Save" class="btn btn-primary" />
          <button type="button" class="btn btn-warning"><a style=" text-decoration: none"
              th:href="@{/home}">Cancel</a></button>
        </div>


      </div>
    </form>
  </div>

</body>

</html>