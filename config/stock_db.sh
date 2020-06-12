#!/bin/bash
set -e

# see: https://docs.docker.com/samples/library/postgres/

# The initialization files in /docker-entrypoint-initdb.d will be executed in sorted name 
# order as defined by the current locale, which defaults to en_US.utf8. Hence the name 
# stock_db.sh to follow the sql file containing the schema.

# scripts in /docker-entrypoint-initdb.d are only run if you start the container with a 
# data directory that is empty; any pre-existing database will be left untouched on 
# container startup. One common problem is that if one of your /docker-entrypoint-initdb.d 
# scripts fails (which will cause the entrypoint script to exit) and your orchestrator 
# restarts the container with the already initialized data directory, it will not continue 
# on with your scripts.


# It is recommended that any psql commands that are run inside of a *.sh script be 
# executed as POSTGRES_USER by using the --username "$POSTGRES_USER" flag. This user will 
# be able to connect without a password due to the presence of trust authentication for 
# Unix socket connections made inside the container.


printf '#! /usr/bin/bash\nstart=%s\n' $(date +"%s") > /usr/local/data/postgres_processing_time.sh

# HGNC_data_load.txt

psql -v ON_ERROR_STOP=1 -U "$POSTGRES_USER" -d "$POSTGRES_DB" -c "\copy hgnc_gene (hgnc_acc_id,symbol,name,locus_group,locus_type,status,location,location_sortable,alias_symbol,alias_name,prev_symbol,prev_name,gene_family,gene_family_acc_id,date_approved_reserved,date_symbol_changed,date_name_changed,date_modified,entrez_acc_id,ensembl_gene_acc_id,vega_acc_id,ucsc_acc_id,ena,refseq_accession,ccds_acc_id,uniprot_acc_ids,pubmed_acc_id,mgi_gene_acc_id,rgd_acc_id,lsdb,cosmic,omim_acc_id,mirbase,homeodb,snornabase,bioparadigms_slc,orphanet,pseudogene_org,horde_acc_id,merops,imgt,iuphar,kznf_gene_catalog,mamit_trnadb,cd,lncrnadb,enzyme_acc_id,intermediate_filament_db,rna_central_acc_ids,lncipedia,gtrnadb,agr_acc_id) FROM '/mnt/non_alt_loci_set.txt' with (DELIMITER E'\t', NULL '', FORMAT CSV, header TRUE)"



psql -v ON_ERROR_STOP=1 -U "$POSTGRES_USER" -d "$POSTGRES_DB" -c "\copy hgnc_gene (hgnc_acc_id,symbol,name,locus_group,locus_type,status,location,location_sortable,alias_symbol,alias_name,prev_symbol,prev_name,gene_family,gene_family_acc_id,date_approved_reserved,date_symbol_changed,date_name_changed,date_modified,entrez_acc_id,ensembl_gene_acc_id,vega_acc_id,ucsc_acc_id,ena,refseq_accession,ccds_acc_id,uniprot_acc_ids,pubmed_acc_id,mgi_gene_acc_id,rgd_acc_id,lsdb,cosmic,omim_acc_id,mirbase,homeodb,snornabase,bioparadigms_slc,orphanet,pseudogene_org,horde_acc_id,merops,imgt,iuphar,kznf_gene_catalog,mamit_trnadb,cd,lncrnadb,enzyme_acc_id,intermediate_filament_db,rna_central_acc_ids,lncipedia,gtrnadb,agr_acc_id) FROM '/mnt/alternative_loci_set.txt' with (DELIMITER E'\t', NULL '', FORMAT CSV, header TRUE)"


# HCOP_data_load.txt into a temporary table.


psql -v ON_ERROR_STOP=1 -U "$POSTGRES_USER" -d "$POSTGRES_DB" -c "\copy hcop_tmp (human_entrez_gene_acc_id,human_ensembl_gene_acc_id,hgnc_acc_id,human_name,human_symbol,human_chr,human_assert_acc_ids,mouse_entrez_gene_acc_id,mouse_ensembl_gene_acc_id,mgi_gene_acc_id,mouse_name,mouse_symbol,mouse_chr,mouse_assert_acc_ids,support) FROM '/mnt/human_mouse_hcop_fifteen_column.txt' with (DELIMITER E'\t', NULL '-', FORMAT CSV, header TRUE)"


# MgiGene_data_load.txt

psql -v ON_ERROR_STOP=1 -U "$POSTGRES_USER" -d "$POSTGRES_DB" -c "\copy mgi_gene (mgi_gene_acc_id,type,symbol,name,genome_build,entrez_gene_acc_id,ncbi_chromosome,ncbi_start,ncbi_stop,ncbi_strand,ensembl_gene_acc_id,ensembl_chromosome,ensembl_start,ensembl_stop,ensembl_strand) FROM '/mnt/MGI_Gene_Model_Coord.rpt' with (DELIMITER E'\t', NULL 'null', FORMAT CSV, header TRUE)"


# MGI_Mrk_List2_data_load.txt

psql -v ON_ERROR_STOP=1 -U "$POSTGRES_USER" -d "$POSTGRES_DB" -c "\copy mgi_mrk_list2 (mgi_marker_acc_id,chr,cM,start,stop,strand,symbol,status,name,marker_type,feature_type,synonyms) FROM '/mnt/MRK_List2.rpt' with (DELIMITER E'\t', NULL '', FORMAT CSV, header TRUE)"

psql -v ON_ERROR_STOP=1 -U "$POSTGRES_USER" -d "$POSTGRES_DB" -c "\copy mouse_gene_synonym (mgi_gene_acc_id,synonym) FROM '/mnt/Mrk_synonyms.txt' with (DELIMITER E'\t', NULL '', FORMAT CSV, header FALSE)"


psql -v ON_ERROR_STOP=1 -U "$POSTGRES_USER" -d "$POSTGRES_DB" -c "\copy human_gene_synonym (hgnc_acc_id,synonym) FROM '/mnt/HGNC_synonyms.txt' with (DELIMITER E'\t', NULL '', FORMAT CSV, header FALSE)"

# Populate mouse gene with all the information in the MGI_Gene_Model_Coord.rpt
psql -v ON_ERROR_STOP=1 -U "$POSTGRES_USER" -d "$POSTGRES_DB" -c "INSERT INTO mouse_gene (symbol,name,mgi_gene_acc_id,type,genome_build,entrez_gene_acc_id,ncbi_chromosome,ncbi_start,ncbi_stop,ncbi_strand,ensembl_gene_acc_id,ensembl_chromosome,ensembl_start,ensembl_stop,ensembl_strand,subtype,mgi_cm,mgi_chromosome,mgi_strand,mgi_start,mgi_stop) 
SELECT mg.symbol,mg.name,mg.mgi_gene_acc_id,mg.type,mg.genome_build,mg.entrez_gene_acc_id,mg.ncbi_chromosome,mg.ncbi_start,mg.ncbi_stop,mg.ncbi_strand,mg.ensembl_gene_acc_id,mg.ensembl_chromosome,mg.ensembl_start,mg.ensembl_stop,mg.ensembl_strand, mrk.feature_type, btrim(mrk.cm), mrk.chr, mrk.strand, mrk.start, mrk.stop from mgi_gene mg
left outer join mgi_mrk_list2 mrk
ON mg.mgi_gene_acc_id = mrk.mgi_marker_acc_id"

# Add the MGI localised genes without NCBI or ENSEMBL coordinates 
# i.e. not present in MGI_Gene_Model_Coord.rpt, only found in the MRK_List2.rpt
psql -v ON_ERROR_STOP=1 -U "$POSTGRES_USER" -d "$POSTGRES_DB" -c "INSERT INTO mouse_gene (symbol,name,mgi_gene_acc_id,type,subtype,mgi_cm,mgi_chromosome,mgi_strand,mgi_start,mgi_stop) SELECT mrk2.symbol, mrk2.name, mrk2.mgi_marker_acc_id, mrk2.marker_type, mrk2.feature_type, btrim(mrk2.cm), mrk2.chr, mrk2.strand, mrk2.start, mrk2.stop FROM ( select * from mgi_mrk_list2 as mrk3 where mrk3.start is not null and mrk3.stop is not null and mrk3.marker_type = 'Gene' and mrk3.mgi_marker_acc_id not in (select mg2.mgi_gene_acc_id from mgi_gene as mg2)) as mrk2"

# Add MGI genes without localisation.
# This includes syntenic, classical genetic markers and unlocalised ESTs 
# (perhaps some of these are genes not present in the reference sequence).
psql -v ON_ERROR_STOP=1 -U "$POSTGRES_USER" -d "$POSTGRES_DB" -c "INSERT INTO mouse_gene (symbol,name,mgi_gene_acc_id,type,subtype, mgi_cm) SELECT mrk2.symbol, mrk2.name, mrk2.mgi_marker_acc_id, mrk2.marker_type, mrk2.feature_type, btrim(mrk2.cm)  FROM (select * from mgi_mrk_list2 as mrk where mrk.marker_type = 'Gene' and mrk.mgi_marker_acc_id not in (select mgi_gene_acc_id from mgi_gene) and mrk.id not in ( select mrk4.id from mgi_mrk_list2 as mrk4 where mrk4.start is not null and mrk4.stop is not null and mrk4.marker_type = 'Gene'  and mrk4.mgi_marker_acc_id not in (select mg4.mgi_gene_acc_id from mgi_gene mg4))) as mrk2"

# Add MGI QTLs with and without localisation. MGI manages their nomenclature
psql -v ON_ERROR_STOP=1 -U "$POSTGRES_USER" -d "$POSTGRES_DB" -c "INSERT INTO mouse_gene (symbol,name,mgi_gene_acc_id,type,subtype,mgi_cm,mgi_chromosome,mgi_strand,mgi_start,mgi_stop) SELECT  mrk.symbol, mrk.name, mrk.mgi_marker_acc_id, mrk.marker_type, mrk.feature_type, btrim(mrk.cm), mrk.chr, mrk.strand, mrk.start, mrk.stop from mgi_mrk_list2 as mrk where mrk.marker_type = 'QTL';"


psql -v ON_ERROR_STOP=1 -U "$POSTGRES_USER" -d "$POSTGRES_DB" -c "DROP table mgi_gene"
psql -v ON_ERROR_STOP=1 -U "$POSTGRES_USER" -d "$POSTGRES_DB" -c "DROP table mgi_mrk_list2"


psql -v ON_ERROR_STOP=1 -U "$POSTGRES_USER" -d "$POSTGRES_DB" -c "INSERT INTO mouse_gene_synonym_relation (mouse_gene_id, mouse_gene_synonym_id) 
SELECT mouse_gene.id, mouse_gene_synonym.id
FROM  mouse_gene, mouse_gene_synonym
WHERE mouse_gene.mgi_gene_acc_id = mouse_gene_synonym.mgi_gene_acc_id"




psql -v ON_ERROR_STOP=1 -U "$POSTGRES_USER" -d "$POSTGRES_DB" -c "INSERT INTO human_gene (symbol,name,hgnc_acc_id,ensembl_gene_acc_id,entrez_gene_acc_id) 
SELECT symbol,name,hgnc_acc_id,ensembl_gene_acc_id,entrez_acc_id from hgnc_gene"

psql -v ON_ERROR_STOP=1 -U "$POSTGRES_USER" -d "$POSTGRES_DB" -c "UPDATE hgnc_gene SET human_gene_id = h.id FROM human_gene h WHERE hgnc_gene.hgnc_acc_id=h.hgnc_acc_id"
psql -v ON_ERROR_STOP=1 -U "$POSTGRES_USER" -d "$POSTGRES_DB" -c "vacuum full hgnc_gene"

psql -v ON_ERROR_STOP=1 -U "$POSTGRES_USER" -d "$POSTGRES_DB" -c "INSERT INTO human_gene_synonym_relation (human_gene_id, human_gene_synonym_id) 
SELECT human_gene.id, human_gene_synonym.id
FROM  human_gene, human_gene_synonym
WHERE human_gene.hgnc_acc_id = human_gene_synonym.hgnc_acc_id"



# Create the final version of HCOP
psql -v ON_ERROR_STOP=1 -U "$POSTGRES_USER" -d "$POSTGRES_DB" -c "INSERT INTO hcop (mouse_gene_id, human_gene_id,human_entrez_gene_acc_id,human_ensembl_gene_acc_id,hgnc_acc_id,human_name,human_symbol,human_chr,human_assert_acc_ids,mouse_entrez_gene_acc_id,mouse_ensembl_gene_acc_id,mgi_gene_acc_id,mouse_name,mouse_symbol,mouse_chr,mouse_assert_acc_ids,support)
select a.mouse_gene_id, human_gene.id as \"human_gene_id\", a.human_entrez_gene_acc_id,a.human_ensembl_gene_acc_id,a.hgnc_acc_id,a.human_name,a.human_symbol,a.human_chr,a.human_assert_acc_ids,a.mouse_entrez_gene_acc_id,a.mouse_ensembl_gene_acc_id,a.mgi_gene_acc_id,a.mouse_name,a.mouse_symbol,a.mouse_chr,a.mouse_assert_acc_ids,a.support from (select mouse_gene.id as \"mouse_gene_id\", h.human_entrez_gene_acc_id,h.human_ensembl_gene_acc_id,h.hgnc_acc_id,h.human_name,h.human_symbol,h.human_chr,h.human_assert_acc_ids,h.mouse_entrez_gene_acc_id,h.mouse_ensembl_gene_acc_id,h.mgi_gene_acc_id,h.mouse_name,h.mouse_symbol,h.mouse_chr,h.mouse_assert_acc_ids,h.support from hcop_tmp h left outer join mouse_gene ON h.mgi_gene_acc_id=mouse_gene.mgi_gene_acc_id) as a left outer join human_gene ON a.hgnc_acc_id=human_gene.hgnc_acc_id"

psql -v ON_ERROR_STOP=1 -U "$POSTGRES_USER" -d "$POSTGRES_DB" -c "DROP TABLE hcop_tmp"



psql -v ON_ERROR_STOP=1 -U "$POSTGRES_USER" -d "$POSTGRES_DB" -c "INSERT INTO ortholog (support, support_raw, support_count,human_gene_id,mouse_gene_id)
select array_to_string(array( select distinct unnest(string_to_array(support, ','))),',') as list, support, array_length(array( select distinct unnest(string_to_array(support, ','))),1) as count, human_gene.id, mouse_gene.id from hcop h, human_gene, mouse_gene 
WHERE h.hgnc_acc_id = human_gene.hgnc_acc_id and 
h.mgi_gene_acc_id = mouse_gene.mgi_gene_acc_id
GROUP BY list, support, count, human_gene.id, mouse_gene.id
order by count desc"


psql -v ON_ERROR_STOP=1 -U "$POSTGRES_USER" -d "$POSTGRES_DB" -c "DROP TABLE hcop"



printf 'end=%s\n' $(date +"%s") >> /usr/local/data/postgres_processing_time.sh
printf "echo -n 'Postgresql processing time: '\n" >> /usr/local/data/postgres_processing_time.sh
echo 'printf "'"%d s\n"'" $(( $end - $start ))'   >> /usr/local/data/postgres_processing_time.sh
chmod 755 /usr/local/data/postgres_processing_time.sh