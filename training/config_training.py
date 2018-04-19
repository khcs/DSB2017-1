config = {'stage1_data_path':'/datasets/stage1/',
          'luna_raw':'/datasets/luna16/',
          'luna_segment':'/datasets/luna16/seg-lungs-LUNA16/',

          'luna_data':'/datasets/preprocess/luna16',
          'preprocess_result_path':'/datasets/preprocess/stage1',

          'luna_abbr':'./detector/labels/shorter.csv',
          'luna_label':'./detector/labels/lunaqualified.csv',
          'stage1_annos_path':['./detector/labels/label_job5.csv',
                './detector/labels/label_job4_2.csv',
                './detector/labels/label_job4_1.csv',
                './detector/labels/label_job0.csv',
                './detector/labels/label_qualified.csv'],
          'bbox_path':'../detector/results/res18/bbox/',
          'preprocessing_backend':'python'
         }
