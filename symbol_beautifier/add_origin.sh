for f in *.sym; do
    echo 'L 0 -50 0 50 8 10 1 0 -1 -1' >> $f
    echo 'L -50 0 50 0 8 10 1 0 -1 -1' >> $f
done
