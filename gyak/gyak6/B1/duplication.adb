function Duplication ( T: Tomb ) return Boolean is
    J: Index := T'First;
    Re: Boolean := False;
begin
    for I in T'Range loop
        if T(Mh) < T(I) then
            Mh := I;
        end if;
    end loop;
    return Mh;
end Duplication;
