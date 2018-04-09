if (typeof(CKEDITOR) != 'undefined') {
    CKEDITOR.editorConfig = function( config )
    {
      config.toolbar = 'MyToolbar'

      config.toolbar_MyToolbar =
        [   
            { name: 'fontstyles', items: [ 'Styles','FontSize','TextColor','BGColor','HorizontalRule' ] },
            { name: 'action', items: [ 'Undo','Redo','Find','Replace','RemoveFormat' ]  },
            { name: 'basicstyles', items: [ 'Bold','Italic','Underline','Strike' ] }, 
            { name: 'paragraph', items: [ 'NumberedList','BulletedList','Outdent','Indent','Blockquote','Table','SpecialChar' ] },
            { name: 'align', items: [ 'JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock' ] },
            { name: 'links', items: [ 'Link','Unlink' ] },
        ];
    config.fontSize_sizes = '14/14px;16/16px;18/18px;20/20px;22/22px;24/24px;28/28px;32/32px;48/48px;64/64px;';
    config.height = '400px';
    config.width = '100%'; 
    config.enterMode = CKEDITOR.ENTER_P;
    config.shiftEnterMode = CKEDITOR.ENTER_BR;
    config.autoParagraph = false;
  }
}
;
