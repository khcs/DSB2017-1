import os, csv
import nibabel as nib

with open('sample_volumes_list.txt') as csvf:
  csvr = csv.reader(csvf)
  for row in csvr:
    cmd = 'python main2.py --model res18 --resume ../../model/detector.ckpt --test 1 '+\
          '--save-dir /datasets/sample_volumes --input_file /datasets/sample_volumes/'+\
          row[0] + '_clean.nii'
    os.system(cmd)

