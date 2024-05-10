import sys
import os
import pdb
import subprocess
import pickle

import numpy as np
import scipy as sp
import scipy.sparse as sps

import porepy as pp


os.system("clear")


def load_eni_grid(path_to_mat):
    """ """
    mrst_grid = sp.io.loadmat(path_to_mat)

    nodes = mrst_grid["node_coord"].T.astype(np.float64)
    fn_row = mrst_grid["fn_node_ind"].astype(np.int32).ravel() - 1
    fn_data = np.ones(fn_row.size, dtype=bool)

    indptr = mrst_grid["fn_indptr"].astype(np.int32).ravel() - 1
    fn = sps.csc_matrix(
        (fn_data, fn_row, indptr),
        shape=(
            fn_row.max() + 1,
            indptr.shape[0] - 1,
        ),
    )

    cf_row = mrst_grid["cf_face_ind"].astype(np.int32).ravel() - 1
    cf_col = mrst_grid["cf_cell_ind"].astype(np.int32).ravel() - 1
    cf_data = mrst_grid["cf_sgn"].ravel().astype(np.float64)

    cf = sps.coo_matrix(
        (cf_data, (cf_row, cf_col)), shape=(cf_row.max() + 1, cf_col.max() + 1)
    ).tocsc()

    dim = nodes.shape[0]

    g = pp.Grid(dim, nodes, fn, cf, "myname")
    g.compute_geometry()

    return g


if __name__ == "__main__":
    mat_file = "./mrst_grid.mat"
    grid = load_eni_grid(mat_file)
    # now do whatever you need with grid...
    exporter = pp.Exporter(grid, "pp_grid")
    exporter.write_vtu()


print("\nDone!")
