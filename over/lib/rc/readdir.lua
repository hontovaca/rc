local ffi = _G.require 'ffi'

-- XXX musl-specific
ffi.cdef [[
typedef uint64_t ino_t;
typedef uint64_t off_t;

struct dirent {
  ino_t d_ino;
  off_t d_off;
  unsigned short d_reclen;
  unsigned char d_type;
  char d_name[256];
};

typedef void DIR; // ok: pointers only
int closedir(DIR *);
DIR *opendir(const char *);
struct dirent *readdir(DIR *);
]]

local function iterdir(h, s)
  local r = ffi.C.readdir(h)
  if r == nil then
    ffi.C.closedir(h)
    return nil
  else
    return ffi.string(r.d_name)
  end
end

function readdir(d)
  return iterdir, ffi.C.opendir(d)
end

function dirents(d)
  local t = {}
  for e in readdir(d) do
    t[e] = e
  end
  return t
end
