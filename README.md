# FFmpeg Encoder Presets

Small helper scripts for batch-transcoding video files with FFmpeg.

The scripts live in platform-specific folders:

- `Windows/` for `.cmd` files
- `MacOs/` for `.command` files

Each script looks for supported video files in the same folder where you run it, then creates `.mkv` output files next to the originals.

## Prerequisites

Before using any preset, make sure you have:

1. [FFmpeg](https://ffmpeg.org/download.html) installed.
2. `ffmpeg` available in your system `PATH`, so it can be run from a terminal or from the scripts.
3. Source video files placed in the folder where you run the preset.

Platform-specific notes:

- Windows: double-clicking a `.cmd` file should open a console window and run the batch job.
- macOS: `.command` files may need executable permission the first time you use them.

## How To Use

1. Choose the preset you want from the `Windows/` or `MacOs/` folder.
2. Copy the preset into the folder that contains the video files you want to convert.
3. Run the script.
4. Wait for FFmpeg to finish processing each file.

The scripts use `-n`, so FFmpeg will not overwrite an existing output file.

## Available Presets

### Windows

- `FFMPEG - HEVC CRF24 MEDIUM.cmd`
- `FFMPEG - HEVC CRF24 FAST.cmd`
- `FFMPEG - HEVC CRF22 SLOW.cmd`
- `FFMPEG - AV1 CQ30 MEDIUM.cmd`
- `FFMPEG - HEVC_NVENC CRF24 MEDIUM .cmd`
- `FFMPEG - HEVC_NVENC CRF24 FAST .cmd`
- `FFMPEG - HEVC_NVENC CRF22 SLOW.cmd`

### macOS

- `FFMPEG - HEVC_VIDEOTOOLBOX CQ65.command`
- `FFMPEG - HEVC_VIDEOTOOLBOX CQ55.command`
- `FFMPEG - HEVC_VIDEOTOOLBOX CQ45.command`
- `FFMPEG - HEVC CRF24 MEDIUM.command`
- `FFMPEG - HEVC CRF24 FAST.command`
- `FFMPEG - HEVC CRF22 SLOW.command`
- `FFMPEG - AV1_VIDEOTOOLBOX CQ30.command`

## What Each Preset Does

The scripts are batch presets for common encoder settings:

- HEVC presets use `libx265`, `hevc_nvenc`, or `hevc_videotoolbox`, depending on the file.
- AV1 presets use `libsvtav1` on Windows and `av1_videotoolbox` on macOS.
- Audio is copied as-is with `-c:a copy`.
- Output files are named after the source file, with a suffix describing the preset, and saved as `.mkv`.

## Supported Input Extensions

The presets process these file types:

- `.mp4`
- `.mov`
- `.mkv`
- `.avi`
- `.m4v`
- `.webm`

Matching is case-insensitive on Windows. On macOS, the scripts enable case-insensitive matching.

## Example

If you run `FFMPEG - HEVC CRF24 MEDIUM.cmd` on `sample.mov`, the output will be:

`sample - HEVC CRF24 MEDIUM.mkv`

## Notes

- If you want to convert files with another extension, add that extension to the loop near the top of the script.
- If FFmpeg is not recognized, check that it is installed correctly and that `ffmpeg.exe` or `ffmpeg` is on your `PATH`.
