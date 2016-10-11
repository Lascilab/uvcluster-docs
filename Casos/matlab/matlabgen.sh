archivo=$(basename "$1")
nombre="${archivo%.*}"
directorio=$(dirname "$1")
runscript='run_'$nombre'.sh'

# mcc -m -R -singleCompThread -R -nodisplay -R -nojvm -nocache ${directorio}/$archivo

echo $archivo
echo $nombre
echo $runscript
echo $directorio

cat > ${directorio}/${nombre}.submit <<EOF
universe                = docker
docker_image            = matlab
executable              = ./${runscript}
arguments               = /opt/mcr/v901
should_transfer_files   = YES
transfer_input_files    = ${nombre}, ${runscript}
when_to_transfer_output = ON_EXIT
output                  = out.\$(Process)
error                   = err.\$(Process)
log                     = log.\$(Process)
environment             = MCR_CACHE_ROOT=/tmp/emptydir;MATLAB_PREFDIR=/tmp/emptydir
queue 1
EOF

cat > ${directorio}/borrar.sh <<EOF
#!/bin/bash
rm -f log.* err.* out.*
EOF

cat > ${directorio}/ejecutar.sh <<EOF
#!/bin/bash
condor_submit ${nombre}.submit
EOF

chmod +x ${directorio}/borrar.sh ${directorio}/ejecutar.sh
