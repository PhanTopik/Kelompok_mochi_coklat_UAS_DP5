program pesantiketpesawat;
uses crt;
type data = record
    nama:string;
    kelas:string;
    kotaawal:string;
    kotatujuan:string;
    harga:longint;
    seat:string;
    hari:string;
    jam:string;
end;
var
    listdata: array[1..10] of data;
    kotaawal,nama,pilihan,kotatujuan,jam,hari,jadwal,kelas,baris,kolom,seat:string;
    jlhpesan,i,n:integer;
    harga,totalharga:longint;
    sesuai,pesan:char;
procedure menu;
begin
    clrscr;
    writeln('selamat datang di aplikasi pesan tiket pesawat');
    writeln('1.pesan tiket pesawat');
    writeln('2.lihat tiket anda');
    writeln('0.keluar');
    write('Pilihan anda (1,2 atau 3): ');
end;
procedure pesantiket;
label 1,2,3,5,6,7;
begin
    clrscr;
    write('masukan jumlah tiket yang ingin dipesan: '); readln(n);
    2: totalharga:=0;
    for i:=1 to n do
        begin
            write('masukan nama lengkap anda: '); readln(nama);   //input data untuk memesan tiket
            writeln('kota yang tersedia:');
            writeln('1.jakarta');
            writeln('2.medan');
            writeln('3.riau');
            5: write('masukan kota awal: '); readln(kotaawal);
            if (kotaawal <>'jakarta') and (kotaawal<>'medan') and (kotaawal<>'riau') then
                begin
                    writeln('kota awal yang anda input tidak valid!');
                    goto 5;
                end;
            6: write('masukan kota tujuan: '); readln(kotatujuan);
            if (kotatujuan <>'jakarta') and (kotatujuan<>'medan') and (kotatujuan<>'riau') then
                begin
                    writeln('kota tujuan yang anda input tidak valid!');
                    goto 6;
                end;
            7: write('masukan kelas yang anda inginkan(ekonomi/bisnis): '); readln(kelas);
            if (kelas<>'ekonomi') and (kelas<>'bisnis') then
                begin
                    writeln('kelas yang anda input tidak valid!');
                    goto 7;
                end;
            write('pilih hari berangkat: '); readln(hari);
            1: writeln('jadwal yang tersedia:');
            writeln('1. 8:00');
            writeln('2. 13:00');
            writeln('3. 18:00');
            write('pilih jadwal(1,2, atau 3): '); readln(jadwal);
            case jadwal of
                '1': jam:='8:00';
                '2': jam:='13:00';
                '3': jam:='18:00';
            else
                begin
                    goto 1;
                end;
            end;
            if (kelas='ekonomi') then
                begin
                    write('masukan baris kursi(11-20): '); readln(baris);
                    write('masukan kolom kursi(A,B,C,D,atau E): '); readln(kolom);
                end
            else if (kelas='bisnis') then
                begin
                    write('masukan baris kursi(1-10): '); readln(baris);
                    write('masukan kolom kursi(A,B,C,D,atau E): '); readln(kolom);
                end;
            if (kotaawal='jakarta') and (kotatujuan='medan') then
                begin
                    if (kelas='ekonomi') then
                        harga:=800000
                    else if (kelas='bisnis') then
                        harga:=1100000
                end
            else if (kotaawal='jakarta') and (kotatujuan='riau') then
                begin
                    if (kelas='ekonomi') then
                        harga:=1200000
                    else if (kelas='bisnis') then
                        harga:=1500000
                end
            else if (kotaawal='medan') and (kotatujuan='jakarta') then
                begin
                    if (kelas='ekonomi') then
                        harga:=2300000
                    else if (kelas='bisnis') then
                        harga:=2600000;
                end
            else if (kotaawal='medan') and (kotatujuan='riau') then
                begin  
                    if (kelas='ekonomi') then
                        harga:=2000000
                    else if (kelas='bisnis') then
                        harga:=2300000
                end
            else if (kotaawal='riau') and (kotatujuan='jakarta') then
                begin
                    if (kelas='ekonomi') then
                        harga:=2300000
                    else if (kelas='bisnis') then
                        harga:=2600000
                end
            else if (kotaawal='riau') and (kotatujuan='medan') then
                begin
                    if (kelas='ekonomi') then
                        harga:=2100000
                    else if (kelas='bisnis') then
                        harga:=2400000
                end;
        totalharga:=totalharga+harga;
        seat:=baris+kolom;
        writeln('data tiket anda');
        writeln('nama anda: ',nama);
        writeln('kota awal: ',kotaawal);
        writeln('kota tujuan: ',kotatujuan);
        writeln('kelas: ',kelas);
        writeln('seat: ',seat);
        writeln('hari berangkat: ',hari);
        writeln('jam berangkat: ',jam);
        writeln('harga tiket pesawat: Rp',harga);
        write('apakah data tiket anda sudah sesuai?(y/n): '); readln(sesuai);  //untuk memastikan bahwa data yang diinput sesuai
        if (sesuai='n') then
            goto 2
        else if (sesuai='y') then
            clrscr;
        inc(jlhpesan);
        listdata[jlhpesan].nama:=nama;
        listdata[jlhpesan].kotaawal:=kotaawal;
        listdata[jlhpesan].kotatujuan:=kotatujuan;
        listdata[jlhpesan].kelas:=kelas;
        listdata[jlhpesan].harga:=harga;
        listdata[jlhpesan].hari:=hari;
        listdata[jlhpesan].jam:=jam;
        listdata[jlhpesan].seat:=seat;
    end;
    writeln('total seluruh harga tiket pesawat: Rp',totalharga);
    3: write('apakah anda yakin ingin memesan tiket ini?(y/n):'); readln(pesan);  //untuk memastikan apakah pengguna ingin memesan tiket atau tidak
    if (pesan='y') then
        begin
            writeln('Terima kasih telah memesan tiket pesawat di aplikasi ini');
        end
    else if (pesan='n') then
        begin
            writeln('pesanan anda telah dibatalkan');
            for i :=1 to jlhpesan do
                begin
                    listdata[i].nama:=' ';
                    listdata[i].kotaawal:=' ';
                    listdata[i].kotatujuan:=' ';
                    listdata[i].kelas:=' ';
                    listdata[i].harga:=0;
                    listdata[i].hari:=' ';
                    listdata[i].jam:=' ';
                    listdata[i].seat:=' ';
                end
        end
    else
        begin
            clrscr;
            goto 3;
        end;
    write('tekan enter untuk lanjut'); readln;
end;
procedure lihattiket;
begin
    clrscr;
    for i:=1 to jlhpesan do
        begin
            writeln(stringofchar('=',60));
            writeln('nama: ',listdata[i].nama);
            writeln('kota awal: ',listdata[i].kotaawal);
            writeln('kota tujuan: ',listdata[i].kotatujuan);
            writeln('kelas: ',listdata[i].kelas);
            writeln('hari berangkat: ',listdata[i].hari);
            writeln('jam berangkat: ',listdata[i].jam);
            writeln('seat: ',listdata[i].seat);
            writeln(stringofchar('=',60));
            writeln;
        end;
    if (jlhpesan=0) then
        writeln('anda belum ada tiket');
    write('tekan enter untuk kembali'); readln;
end;
begin
    clrscr;
    jlhpesan:=0;
    repeat
    menu;
    readln(pilihan);
    case pilihan of
        '1': pesantiket; 
        '2': lihattiket;
        '0': write('Terima Kasih telah menggunakan aplikasi ini');
    end;
    until(pilihan='0');
end.