import h5py
import numpy as np
import sys

different = False
rtol = 1e-5
atol = 1e-8


def errorMsg(path1, path2, prefix, postfix):
<<<<<<< c41a68c33d9a0f5a11d26e492bbbfc217d797b63
  global different
=======
>>>>>>> enabling restart
  print prefix + path1 + " and " + path2 + postfix
  different = True


def nameErrorMsg(path1, path2, typeName, msgs):
<<<<<<< c41a68c33d9a0f5a11d26e492bbbfc217d797b63
  global different
=======
>>>>>>> enabling restart
  print path1 + " has a " + typeName + " that is not in " + path2 + ": " + msg
  different = True


def compareArrays(path1, arr1, path2, arr2):
<<<<<<< c41a68c33d9a0f5a11d26e492bbbfc217d797b63
  if arr1.dtype in [np.float16, np.float32, np.float64, np.complex64, np.complex128]:
    notClose = np.logical_not(np.isclose(arr1, arr2, rtol, atol))
  else:
    notClose = (arr1 != arr2)

  if notClose.any():
    numNotClose = notClose.sum()
    errorMsg(path1, path2, "Datasets ", " have " + str(numNotClose) + " items that aren't close.")
=======
  if data1.dtype in [np.float16, np.float32, np.float64, np.complex64, np.complex128]:
    notClose = np.logical_not(np.isclose(data1, data2, rtol, atol))
  else:
    notClose = (data1 != data2)

  if np.notClose.any():
    numNotClose = notClose.sum()
    errorMsg(path1, path2, "Datasets ", " have " + numNotClose + " items that aren't close.")
>>>>>>> enabling restart


def compareAttributes(path1, attr1, path2, attr2):
  if len(attr1.keys()) != len(attr2.keys()):
    errorMsg(path1, path2, "Attributes of ", " have different lengths.")

  for attrName in attr1.keys():
    if attrName not in attr2:
      nameErrorMsg(path1, path2, "Attribute", attrName)
<<<<<<< c41a68c33d9a0f5a11d26e492bbbfc217d797b63

    attr1Path = path1 + ".attrs[" + attrName + "]"
    attr2Path = path2 + ".attrs[" + attrName + "]"
    if attr1[attrName].type != attr2[attrName].type:
      errorMsg(attr1Path, attr2Path, "Attributes ", " have different types.")

    compareArrays(attr1Path, attr1[attrName], attr2Path, attr2[attrName])


def compareDatasets(dset1, dset2):
  path1 = dset1.file.filename + dset1.name
  path2 = dset2.file.filename + dset2.name
=======
    compareArrays(path1 + ".attrs[" + attrName + "]", attr1[attrName], path2 + ".attrs[" + attrName + "]", attr2[attrName])


def compareDatasets(dset1, dset2):
  path1 = dset1.name
  path2 = dset2.name
>>>>>>> enabling restart
  if dset1.shape != dset2.shape:
    errorMsg(path1, path2, "Datasets ", " have different shapes: " + dset1.shape + " " + dset2.shape)
  if dset1.dtype != dset2.dtype:
    errorMsg(path1, path2, "Datasets ", " have different types: " + dset1.type + " " + dset2.type)

<<<<<<< c41a68c33d9a0f5a11d26e492bbbfc217d797b63
  compareAttributes(path1, dset1.attrs, path2, dset2.attrs)
  compareArrays(path1, dset1[:], path2, dset2[:])


def compareGroups(group1, group2):
  path1 = group1.file.filename + group1.name
  path2 = group2.file.filename + group2.name
=======
  compareAttributes(dset1.attrs, dset2.attrs)
  compareArrays(dset1[:], dset2[:])


def compareGroups(group1, group2):
  path1 = group1.name
  path2 = group2.name
>>>>>>> enabling restart
  if len(group1.keys()) != len(group2.keys()):
    errorMsg(path1, path2, "Groups ", " have a different number of items.")
  
  compareAttributes(path1, group1.attrs, path2, group2.attrs)

  for name in group1.keys():
    item1 = group1[name]
    if name not in group2:
      if type(item1) == h5py.Group:
        nameErrorMsg(path1, path2, "Group", name)
      else:
        nameErrorMsg(path1, path2, "Dataset", name)

    item2 = group2[name]
    if type(item1) != type(item2):
      errorMsg(item1.name, item2.name, "", " are of different type: " + type(item1) + " " + type(item2) + ".")

    if type(item1) == h5py.Group:
      compareGroups(item1, item2)
    else:
      compareDatasets(item1, item2)


def main():
  if len(sys.argv) < 3:
    print "need file arguments"
    exit(1)

  path1 = sys.argv[1]
  path2 = sys.argv[2]

  if len(sys.argv) > 3:
    rtol = float(sys.argv[3])
  if len(sys.argv) > 4:
    atol = float(sys.argv[4])

  f1 = h5py.File(path1, "r")
  f2 = h5py.File(path2, "r")

  compareGroups(f1, f2)
<<<<<<< c41a68c33d9a0f5a11d26e492bbbfc217d797b63
  print
=======
>>>>>>> enabling restart
  if not different:
    print "The files are similar."
    return 0
  else:
    print "The files are different"
    return 1


if __name__ == "__main__" and not sys.flags.interactive:
  sys.exit(main())

