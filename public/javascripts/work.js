(function(){
  var initializing = false, fnTest = /xyz/.test(function(){xyz;}) ? /\b_super\b/ : /.*/;
  // The base Class implementation (does nothing)
  this.Class = function(){};
  
  // Create a new Class that inherits from this class
  Class.extend = function(prop) {
    var _super = this.prototype;
    
    // Instantiate a base class (but only create the instance,
    // don't run the init constructor)
    initializing = true;
    var prototype = new this();
    initializing = false;
    
    // Copy the properties over onto the new prototype
    for (var name in prop) {
      // Check if we're overwriting an existing function
      prototype[name] = typeof prop[name] == "function" && 
        typeof _super[name] == "function" && fnTest.test(prop[name]) ?
        (function(name, fn){
          return function() {
            var tmp = this._super;
            
            // Add a new ._super() method that is the same method
            // but on the super-class
            this._super = _super[name];
            
            // The method only need to be bound temporarily, so we
            // remove it when we're done executing
            var ret = fn.apply(this, arguments);        
            this._super = tmp;
            
            return ret;
          };
        })(name, prop[name]) :
        prop[name];
    }
    
    // The dummy class constructor
    function Class() {
      // All construction is actually done in the init method
      if ( !initializing && this.init )
        this.init.apply(this, arguments);
    }
    
    // Populate our constructed prototype object
    Class.prototype = prototype;
    
    // Enforce the constructor to be what we expect
    Class.constructor = Class;

    // And make this class extendable
    Class.extend = arguments.callee;
    
    return Class;
  };
})();

var PendingUploader = {
	forms: [],
	install: function(formElement) {
		var form = new PendingUploader.Form(formElement);
		PendingUploader.forms.push(form);
		return form;
	}
}

PendingUploader.Form = Class.extend({
	init: function(element) {
		this.element = element;
		this.innerHTML = $(element).html();
		this.attachmentManager = this.createAttachmentManager();
		$(this.element).bind('submit', this.submit)
	},
	
	submit: function() {
		return false;
	},
	
	createAttachmentManager: function() {
		return PendingUploader.AttachmentManager.createAttachmentManager({
			
		});
	}
})


PendingUploader.AttachmentManager = Class.extend({
	init: function(options) {
		
	}
})

PendingUploader.AttachmentManager.createAttachmentManager = function(options, preferences) {
	return new PendingUploader.FlashAttachmentManager(options);
}

PendingUploader.FlashAttachmentManager = PendingUploader.AttachmentManager.extend({
	init: function(options) {
		this._super(options);
		this.totalBytesQueued = 0;
	},
	
	createSWFUpload: function(placeholder, width, height) {
		this.swfUpload = new SWFUpload(this.optionsForSWFUpload(placeholder, width, height));
	},
	
	optionsForSWFUpload: function(placeholder, width, height) {
		return {
			flash_url: '/flash/swfupload/swfupload.swf',
			upload_url: this.options.uploadURL,
			button_width: 380, button_height: 32,
			button_width: width, button_height: height,
			button_text : '<span class="button">Add</span>',
			button_text_style : '.button { font-family: Helvetica, Arial, sans-serif; font-size: 16px; color: #2098E5}',
			button_placeholder_id: placeholder.identify(),
			file_size_limit: this.options.fileSizeLimit,
			file_dialog_start_handler: this.onChooseFileDialogOpened,
      file_queued_handler: this.onAttachmentQueued,
      file_queue_error_handler: this.onAttachmentQueueFailed,
      file_dialog_complete_handler: this.onChooseFileDialogClosed,
      upload_start_handler: this.onUploadStarted,
      upload_progress_handler: this.onUploadProgressChanged,
      upload_success_handler: this.onUploadSucceeded,
      upload_error_handler: this.onUploadFailed,
      upload_complete_handler: this.onUploadCompleted,
			button_window_mode: SWFUpload.WINDOW_MODE.TRANSPARENT,
      button_cursor: SWFUpload.CURSOR.HAND
		}
	}
})

$('form.swf_upload').each(function(i) {
	PendingUploader.install($(this));
});