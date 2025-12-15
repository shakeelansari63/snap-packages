#!/bin/bash
SRC_DIR=$1
echo "Fixing Paths in ${SRC_DIR}"
if [[ "${SRC_DIR}" == "" ]]
then
    SRC_DIR='.'
fi

# Fix Paths
find ${SRC_DIR} -type f -name '*.sh' -exec sed -i 's#${SDKMAN_DIR}/candidates#${SNAP_USER_COMMON}/candidates#g' {} \;
find ${SRC_DIR} -type f -name '*.sh' -exec sed -i 's#"$SDKMAN_DIR"/candidates#${SNAP_USER_COMMON}/candidates#g' {} \;
find ${SRC_DIR} -type f -name '*.sh' -exec sed -i 's#$SDKMAN_DIR/candidates#${SNAP_USER_COMMON}/candidates#g' {} \;
find ${SRC_DIR} -type f -name '*.sh' -exec sed -i 's#${SDKMAN_DIR}/tmp#${SNAP_USER_COMMON}/tmp#g' {} \;
find ${SRC_DIR} -type f -name '*.sh' -exec sed -i 's#"$SDKMAN_DIR"/tmp#${SNAP_USER_COMMON}/tmp#g' {} \;
find ${SRC_DIR} -type f -name '*.sh' -exec sed -i 's#$SDKMAN_DIR/tmp#${SNAP_USER_COMMON}/tmp#g' {} \;
find ${SRC_DIR} -type f -name '*.sh' -exec sed -i 's#${SDKMAN_DIR}/var/delay_upgrade#${SNAP_USER_COMMON}/var/delay_upgrade#g' {} \;
find ${SRC_DIR} -type f -name '*.sh' -exec sed -i 's#"${SDKMAN_DIR}"/var/delay_upgrade#${SNAP_USER_COMMON}/var/delay_upgrade#g' {} \;
find ${SRC_DIR} -type f -name '*.sh' -exec sed -i 's#$SDKMAN_DIR/var/delay_upgrade#${SNAP_USER_COMMON}/var/delay_upgrade#g' {} \;
find ${SRC_DIR} -type f -name '*.sh' -exec sed -i 's#${SDKMAN_DIR}/var/metadata#${SNAP_USER_COMMON}/var/metadata#g' {} \;
find ${SRC_DIR} -type f -name '*.sh' -exec sed -i 's#"${SDKMAN_DIR}"/var/metadata#${SNAP_USER_COMMON}/var/metadata#g' {} \;
find ${SRC_DIR} -type f -name '*.sh' -exec sed -i 's#$SDKMAN_DIR/var/metadata#${SNAP_USER_COMMON}/var/metadata#g' {} \;
find ${SRC_DIR} -type f -name '*.sh' -exec sed -i '/sdkman_cleanup_dir="${SDKMAN_DIR}\/${folder}"/a\
    [[ "${folder}" == "tmp" ]] || [[ "${folder}" == "var/metadata" ]] && sdkman_cleanup_dir="${SNAP_USER_COMMON}/${folder}"' {} \;

# Add path Fix for Post Hook Scripts too
find ${SRC_DIR} -type f -name '*.sh' -exec sed -i '/__sdkman_secure_curl "${SDKMAN_CANDIDATES_API}\/hooks\/post\/${candidate}\/${version}\/${platform_parameter}" >| "$post_installation_hook"/a\
    ${SDKMAN_DIR}/bin/fix_script_paths.sh "${SNAP_USER_COMMON}/tmp"' {} \;
