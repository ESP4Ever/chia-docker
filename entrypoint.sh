if [[ ! "$(ls ${plots_dir}/*.plot)" ]]; then
  echo "${plots_dir} directory appears to be empty and you have not specified another, please mounting a plot directory "
fi
