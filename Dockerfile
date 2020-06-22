FROM slicer/buildenv-qt5-centos7:latest
MAINTAINER Sam Horvath <sam.horvath@kitware.com>

RUN pip install ctk-cli

COPY . /brains
RUN mkdir /brains-rel

# Perform build of the iMIQ CLIs
WORKDIR /brains-rel
RUN cmake \
  -DCMAKE_BUILD_TYPE=Release \
  -DBRAINSTools_REQUIRES_TBB=OFF \
  -DBRAINSTools_REQUIRES_FFTW=OFF \
  -DBRAINSTools_BUILD_DICOM_SUPPORT=OFF \
  -DBRAINSTools_DISABLE_TESTING=ON \
  -DUSE_DebugImageViewer=OFF \
  -DBRAINS_DEBUG_IMAGE_WRITE=OFF \
  -DUSE_BRAINSRefacer=OFF \
  -DUSE_AutoWorkup=OFF \
  -DUSE_ReferenceAtlas=OFF \
  -DUSE_ANTS=OFF \
  -DUSE_BRAINSABC=OFF \
  -DUSE_BRAINSTalairach=OFF \
  -DUSE_BRAINSMush=OFF \
  -DUSE_BRAINSInitializedControlPoints=OFF \
  -DUSE_BRAINSMultiModeSegment=OFF \
  -DUSE_ImageCalculator=OFF \
  -DUSE_BRAINSSnapShotWriter=OFF \
  -DUSE_ConvertBetweenFileFormats=OFF \
  -DUSE_BRAINSMultiSTAPLE=OFF \
  -DUSE_BRAINSCreateLabelMapFromProbabilityMaps=OFF \
  -DUSE_BRAINSContinuousClass=OFF \
  -DUSE_BRAINSPosteriorToContinuousClass=OFF \
  -DUSE_GTRACT=OFF \
  -DUSE_BRAINSConstellationDetector=OFF \
  -DUSE_BRAINSLandmarkInitializer=OFF \
  -DUSE_BRAINSFit=ON \
  -DUSE_BRAINSROIAuto=ON \
  -DUSE_BRAINSResample=ON \
  -DUSE_BRAINSTransformConvert=ON \
  -DUSE_DWIConvert=OFF  \
  /brains 

RUN make zlib && make

