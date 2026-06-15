var imgCropperModule = (function(cropdata) {


	function dataURItoBlob(dataURI) {
		var byteString = atob(dataURI.split(',')[1]);
		var mimeString = dataURI.split(',')[0].split(':')[1].split(';')[0]
		var ab = new ArrayBuffer(byteString.length);
		var ia = new Uint8Array(ab);
		for (var i = 0; i < byteString.length; i++) {
			ia[i] = byteString.charCodeAt(i);
		}
		var blob = new Blob([ab], {type: mimeString});
		return blob;

	}


	function popupResult(result,ajaxparams) {

		if (result.src) {

			var blob=dataURItoBlob(result.src);
			var formData = new FormData();
			$(ajaxparams.loader).show();

			formData.append('img[]', blob);
			formData.append('imgtype',ajaxparams.type);
			$.ajax(ajaxparams.url, {
				method: 'POST',
				data: formData,
				processData: false,
				contentType: false,

				success: function (e) {
					$(ajaxparams.thumbnail).attr('src',e);
					$(ajaxparams.loader).hide();
				},

				error: function () {
					alert('failed');
				},

				complete: function () {
					if(ajaxparams.modalflag=="hide"){
						$('.modal').modal('hide');
					}
				},
			});

		}



	}


	function imgUpload(cropdata) {
		var $uploadCrop;
		function readFile(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function (e) {
					$(cropdata.parentWrapperClass).addClass('ready');
					$uploadCrop.croppie('bind', {
						url: e.target.result
					}).then(function(){
						console.log('jQuery bind complete');
					});

				}

				reader.readAsDataURL(input.files[0]);
			}
			else {
				swal("Sorry, Try again!");
			}
		}

		$uploadCrop = $(cropdata.cropperElementId).croppie({
			viewport: {
				width: cropdata.cropViewportParam.width,
				height: cropdata.cropViewportParam.height,
				type: cropdata.cropViewportParam.type,

			},
			boundary: {
				width: cropdata.cropBoundaryParam.width,
				height: cropdata.cropBoundaryParam.height
			},
			enableResize: cropdata.resize,
			enableOrientation: cropdata.orientation,
			enableExif: true
		});

		$(cropdata.inputFileElementID).on('change', function () { readFile(this); });
		$(cropdata.fileUploadSave).on('click', function (ev) {
			ev.preventDefault();
			ev.stopPropagation();
			$uploadCrop.croppie('result', {
				type: cropdata.cropResultParam.type,
				size: cropdata.cropResultParam.size,
				quality:cropdata.cropResultParam.quality,
				format:cropdata.cropResultParam.format,

			}).then(function (resp) {
				popupResult({
					src: resp
				},cropdata.imgPostParams);
			});
		});
	}




	function init(cropdata) {
		imgUpload(cropdata);
	}

	return {
		init: (cropdata)=>{
			return init(cropdata)
		}
	};
})();
