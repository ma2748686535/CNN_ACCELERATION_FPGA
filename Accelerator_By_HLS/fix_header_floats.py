import os

header_dir = r'C:\Users\Administrator\Desktop\EEE'  

def fix_header_file(filepath):
    with open(filepath, 'r') as f:
        lines = f.readlines()

    output = []
    in_array = False
    for line in lines:
        stripped = line.strip()
        if not stripped:
            continue
        if '=' in stripped and '{' in stripped:
            in_array = True
            output.append(stripped)
        elif '};' in stripped:
            last_line = output.pop()
            last_line = last_line.rstrip(',')
            output.append(last_line)
            output.append('};')
            in_array = False
        elif in_array:
            parts = stripped.split(',')
            new_parts = []
            for p in parts:
                p = p.strip()
                if p:
                    if not p.endswith('f'):
                        if '.' not in p:
                            p += '.0f'
                        elif not p.endswith('f'):
                            p += 'f'
                    new_parts.append(p)
            output.append(', '.join(new_parts))

    with open(filepath, 'w') as f:
        for line in output:
            f.write(line + '\n')
    print(f"✅ Fixed: {os.path.basename(filepath)}")


for fname in os.listdir(header_dir):
    if fname.endswith('.h'):
        fix_header_file(os.path.join(header_dir, fname))
