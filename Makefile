.PHONY: all $(images_to_push)

containers := magento__nginx-web magento__fpm-checker magento__web
images_to_push=$(foreach container,$(containers),push-image-$(container))


base-image:
	sleep 3 && echo "base-image"

push-images: base-image $(images_to_push)

$(images_to_push): push-image-%:
	# Need to convert double underscores in container name to single underscores
	sleep 1 && echo docker tag ${*}:v_${BUILD_NUMBER} $(subst __,_,${*}):prod_${BUILD_NUMBER}

clean: job1 job2 job3
	echo clean $?
