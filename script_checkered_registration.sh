dim=2
export ITK_GLOBAL_DEFAULT_NUMBER_OF_THREADS=10
m=s_checkered_tgt_image.nii.gz
f=s_checkered_ref_image.nii.gz
output_prefix=checkred_
#m=l_chalf.nii.gz
#f=l_conethird.nii.gz
#output_prefix=c_
its=[1500x1500x1500x800x600x100,0,5]
smth=10x8x6x4x2x1vox
down=10x8x6x4x2x1
$ANTSPATH/antsRegistration -d $dim  \
			-m demons[ $f,$m, 0.5, 0 ] \
			-m meansquares[ $f,$m, 1, 0 ] \
                        -t TimeVaryingVelocityField[ 2.0, 8, 1,0.0, 0.05,0 ] \
                        -c $its  \
                        -s $smth  \
                        -f $down \
			-a 1 \
			-v 1 \
                        -u 1 \
			-z 0 \
                        -o [$output_prefix]
# $ANTSPATH/antsApplyTransforms -d $dim -i $m -r $f -o output/ex_warpedC.nii.gz -t ex_0InverseWarp.nii.gz 
# $ANTSPATH/antsApplyTransforms -d $dim -i $f -r $m -o output/ex_warpedChalf.nii.gz -t ex_0Warp.nii.gz 
# $ANTSPATH/CreateWarpedGridImage $dim output/ex_0InverseWarp.nii.gz output/grid.nii.gz 
# $ANTSPATH/ConvertToJpg output/grid.nii.gz figures/grid.png 
# $ANTSPATH/CreateJacobianDeterminantImage 2 output/ex_0Warp.nii.gz output/jac.nii.gz 0 1
# $ANTSPATH/CreateJacobianDeterminantImage 2 output/ex_0InverseWarp.nii.gz output/jac_inv.nii.gz 0 1
