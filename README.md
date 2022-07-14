# New globally distributed lineages of Aratimonadetes bacteria capable of acetogenesis

Repository that contain the main data and scripts to compute the supplementary figure from:

Carlton et al., 


`Last updated: July 2022`


## Metabolic potential Scores

Steps to compute [MEBS](https://github.com/valdeanda/mebs) scores in 77 MAGs + references described in the study contained in the <zipacna genomes faa> folder. 
  
1. Compute scores and metabolic completeness (Supplementary Table X)   

```
perl mebs.pl -input <zipacna genomes faa> -type genomic -comp > zipacna.tsv 
```

 2. Normalize scores, generate figures and generate MEBS files to map to itol or perform downstream clustering analyses
 
This script will generate a directory named zipacna.tsv_vis_out/ files and figures
  
```
python3 mebs_vis.py zipacna.tsv  
```

---

## Metabolic completeness

Using the script from the [Useful scripts github repo](https://github.com/valdeanda/Useful_scripts/blob/master/README.md#heatmap) written by [Dr. Cesar Poot](https://scholar.google.com.mx/citations?user=dwpBCCQAAAAJ&hl=en), we used the output derived from step 2 to generate a hetmap with the completeness of serval metabolic pathways predefined in MEBS 

```
python3 heatmap.py  -f pdf data_heatmapZipacna.tsv
```

![heatmap](./heatmap.png)

---

## Metabolic relateness 

 3. Generate the clustering visualization with the file that contains the normalized scores of a data set of 2,107 non redundant genomes internaly storage in MEBS + scores of the genomes described in this study + references found in Supplementary Table 2 
  
```
python3 F_MEBS_cluster.py  --all  zipacna.tsv_vis_out/zipacna.tsv_2_cluster_mebs.tsv

```

![cluster](./zipacna_plot_all_std.png)
  
4. Using the above information, we decided to project the data using pca using kmeans as clustering method 

```
python3 F_MEBS_cluster.py  -p pca -c kmeans  zipacna.tsv_vis_out/zipacna.tsv_2_cluster_mebs.tsv

```

![cluster](./zipacna_std_kmeans_pca.png)

---
